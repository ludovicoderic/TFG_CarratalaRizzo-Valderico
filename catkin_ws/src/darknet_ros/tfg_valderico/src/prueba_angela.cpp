#include <iostream>
#include <vector>
#include <string>
#include <stdexcept>
#include <string.h>
#include <dirent.h>
#include <assert.h>

#include <pcl/io/pcd_io.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/filters/filter.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/search/kdtree.h>
#include <pcl/keypoints/sift_keypoint.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/fpfh.h>
#include <pcl/registration/correspondence_estimation.h>
#include <pcl/registration/correspondence_rejection_sample_consensus.h>
#include <pcl/registration/eigen.h>
#include <pcl/visualization/point_cloud_handlers.h>
#include <pcl/registration/icp.h>
#include <pcl/keypoints/iss_3d.h>
#include <pcl/keypoints/harris_3d.h>
#include <pcl/point_types.h>
#include <pcl/features/shot.h> 

#include <pcl/visualization/point_cloud_handlers.h>




using point3D = pcl::PointXYZ;
using colorPoint3D = pcl::PointXYZRGB;
using intensityPoint3D = pcl::PointXYZI;
using normalPoint = pcl::PointNormal;
using pointWS = pcl::PointWithScale;
using pointFPFH = pcl::FPFHSignature33;
using pointSHOT = pcl::SHOT352;
template <class T> using pcloud = pcl::PointCloud<T>;
template <class T> using pcloudPtr = boost::shared_ptr< pcloud<T> >;
// pcloudPtr AKA pcl::PointCloud<T>::Ptr //

void spawnViewer(pcloudPtr<colorPoint3D> pointCloud) {
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer ("3D Viewer"));
  viewer->addCoordinateSystem (1.0);
  pcl::visualization::PointCloudColorHandlerRGBField<colorPoint3D> rgb(pointCloud);
  viewer->addPointCloud<colorPoint3D> (pointCloud, rgb, "id0");
  while(!viewer->wasStopped ()) {
    viewer->spinOnce(100);
    boost::this_thread::sleep(boost::posix_time::microseconds(100000));
  }
  viewer->close();
}
/*
voiv voxelGrid(cloud){
    //outputCloud = 
    pcl::VoxelGrid<pcl::PointXYZRGBA> voxelgrid_filter;
    voxelgrid_filter.setInputCloud (inputCloud);
    voxelgrid_filter.setLeafSize (leaf, leaf, leaf)
    voxelgrid_filter.filter (*outputCloud);
}

void rotationCloud(cloud, theta){
    Eigen::Affine3f transform(Eigen::Affine3f::Identity());
    Eigen::Vector3f rotation(0,0,theta);
    transform.rotate (Eigen::AngleAxisf (rotation[0],Eigen::Vector3f::UnitZ()));
    transform.rotate (Eigen::AngleAxisf (rotation[1],Eigen::Vector3f::UnitY()));
    transform.rotate (Eigen::AngleAxisf (rotation[2],Eigen::Vector3f::UnitX()));
}
*/
template <typename T>
void loadPCDs(pcloudPtr<T>& scene, std::vector< pcloudPtr <T> >& objects_vector){
  DIR* d;
  struct dirent* dir;
  std::string objectsFolder = "../objects/";
  d = opendir(objectsFolder.c_str());
  if(!d){
     throw std::runtime_error("Runtime exception ocurred: "
      "Couldn't open folder "+objectsFolder);
  }
  while((dir = readdir(d)) != NULL){
    if(dir->d_name[0] == '.')
      continue;
    std::string objectName = objectsFolder + dir->d_name;
    pcloudPtr<T> tmp (new pcloud<T>);
    if(pcl::io::loadPCDFile<T>(objectName,*tmp) == -1){
      throw std::runtime_error("Runtime exception ocurred: "
      "Couldn't read file "+objectName);
    }
    objects_vector.push_back(tmp);
  }
  std::string scene_name = "../scenes/snap_0point.pcd";
  if(pcl::io::loadPCDFile<T>(scene_name,*scene) == -1){
    throw std::runtime_error("Runtime exception ocurred: "
    "Couldn't read file "+scene_name);
  }
}

template <typename T>
void removeNaN(pcloudPtr<T>& cloud){
    std::vector<int> aux;
    pcl::removeNaNFromPointCloud(*cloud,*cloud,aux);
}

/*
template <typename T>
void segmentCloud(pcloudPtr<T>& cloud){
  pcloudPtr<T> cloudFiltered (new pcloud<T>);
  pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliers (new pcl::PointIndices);
  pcl::ExtractIndices<T> extract;
  pcl::SACSegmentation<T> seg;
  std::vector<float> threshold_vector;
  
  // INTRODUCIMOS EN EL THRESHOLD VECTOR
  // LOS VALORES QUE USAREMOS EN EL
  // RANSAC PARA LA SEGMENTACION
  
  threshold_vector.push_back(0.05);
  threshold_vector.push_back(0.05);
  threshold_vector.push_back(0.02);
  
  // CONFIGURAMOS EL SAC SEGMENTATION
  // Y EL EXTRACT INDICES
  
  seg.setOptimizeCoefficients (true);
  seg.setModelType (pcl::SACMODEL_PLANE);
  seg.setMethodType (pcl::SAC_RANSAC);
  seg.setMaxIterations (2000);
  extract.setNegative(true);
  
  // SEGMENTAMOS LA IMAGEN
  
  for(int i = 0; i < threshold_vector.size(); i++){
    seg.setDistanceThreshold(threshold_vector[i]);
    seg.setInputCloud (cloud);
    seg.segment (*inliers, *coefficients);
    if(inliers->indices.size () == 0){
      throw std::runtime_error("Runtime exception ocurred: "
      "Could not estimate a planar model for the given PointCloud."
      );
    }
    extract.setInputCloud(cloud);
    extract.setIndices(inliers);
    extract.filter(*cloudFiltered);
    cloud->swap(*cloudFiltered);
  }
}

void detectorSift(pcloudPtr<colorPoint3D>& cloud, pcloudPtr<colorPoint3D>& keypoints,
        pcloudPtr<normalPoint>& normals,float min_scale,int nr_octaves,
        int nr_scales_per_octave,float min_contrast,float radius){
  pcloudPtr<pointWS> tmp_ws (new pcloud<pointWS>);
  pcl::NormalEstimation<colorPoint3D,normalPoint> ne;
  pcl::SIFTKeypoint<colorPoint3D,pointWS> sift; 
  pcl::search::KdTree<colorPoint3D>::Ptr tree_n(new pcl::search::KdTree<colorPoint3D>());
  pcl::search::KdTree<colorPoint3D>::Ptr tree_sift(new pcl::search::KdTree<colorPoint3D>());
  
  sift.setInputCloud(cloud);
  sift.setSearchMethod (tree_sift);
  sift.setScales (min_scale, nr_octaves, nr_scales_per_octave);
  sift.setMinimumContrast (min_contrast);
  sift.setSearchSurface(cloud);
  sift.setRadiusSearch (radius);
  sift.compute(*tmp_ws);
  pcl::copyPointCloud(*tmp_ws,*keypoints);
  ne.setInputCloud(keypoints);
  ne.setSearchMethod(tree_n);
  ne.setRadiusSearch(radius);
  ne.compute(*normals);
}

void descriptorSHOT(pcloudPtr<colorPoint3D>& cloud, pcloudPtr<colorPoint3D>& keypoints,
        pcloudPtr<normalPoint>& normals, pcloudPtr<pointSHOT>& output, double rsearch){
  pcl::SHOTEstimation<colorPoint3D, normalPoint, pointSHOT> shot;
  shot.setInputCloud(keypoints);
  shot.setInputNormals(normals);
  // The radius that defines which of the keypoint's neighbors are described.
	// If too large, there may be clutter, and if too small, not enough points may be found.
  shot.setRadiusSearch(rsearch);
  shot.compute(*output);
}

void determineCorrespondences(pcloudPtr<colorPoint3D>& keypoints_target,
            pcloudPtr<colorPoint3D>& keypoints_in,
            pcloudPtr<pointSHOT>& descriptor_target,
            pcloudPtr<pointSHOT>& descriptor_in,Eigen::Matrix4f& transformation){
  pcl::registration::CorrespondenceEstimation<pointSHOT,pointSHOT> est;
  est.setInputSource(descriptor_in);
  est.setInputTarget(descriptor_target);
  pcl::CorrespondencesPtr corr (new pcl::Correspondences);
  est.determineReciprocalCorrespondences (*corr);
  boost::shared_ptr<pcl::Correspondences> corr_inliers(new pcl::Correspondences);
  pcl::registration::CorrespondenceRejectorSampleConsensus<colorPoint3D> reg;
  reg.setInputSource(keypoints_in);
  reg.setInputTarget(keypoints_target);
  reg.setInlierThreshold(40.0);
  reg.setMaximumIterations(2000);
  reg.setInputCorrespondences(corr);
  reg.getCorrespondences(*corr_inliers);
  transformation = reg.getBestTransformation();
}

void ICP(pcloudPtr<colorPoint3D>& transformed,pcloudPtr<colorPoint3D>& scene,
        Eigen::Matrix4f& transformation){
  pcloudPtr<colorPoint3D> final(new pcloud<colorPoint3D>);
  pcl::IterativeClosestPoint<colorPoint3D,colorPoint3D> icp;
  icp.setInputSource(transformed);
  icp.setInputTarget(scene);
  icp.align(*final);
  transformation = icp.getFinalTransformation();
}
*/

void main_f (int argc, char** argv){

  /*
  std::vector< pcloudPtr <colorPoint3D> > objects_vector;
  pcloudPtr<colorPoint3D> scene (new pcloud<colorPoint3D>);

  std::vector< pcloudPtr <colorPoint3D> > objects_keypoints_vector;
  pcloudPtr<colorPoint3D> scene_keypoints (new pcloud<colorPoint3D>);
  std::vector< pcloudPtr <colorPoint3D> > scene_keypoints_vector;

  std::vector< pcloudPtr <normalPoint> > objects_normals_vector;
  pcloudPtr<normalPoint> scene_normals (new pcloud<normalPoint>);
  std::vector< pcloudPtr <normalPoint> > scene_normals_vector;

  std::vector< pcloudPtr <pointSHOT> > objects_descriptor_vector;
  pcloudPtr<pointSHOT> scene_descriptor (new pcloud<pointSHOT>);
  std::vector< pcloudPtr <pointSHOT> > scene_descriptor_vector;
  */
 
  std::vector<Eigen::Matrix4f> objects_transformation_vector;

  
  // 1. PLC
  // 2. MUÑECO
  // 3. TAZA
  // 4. PLANTA
  
  /*
    std::vector<float> min_scale;
    min_scale.push_back(0.005f);
    min_scale.push_back(0.01f);
    min_scale.push_back(0.001f);
    min_scale.push_back(0.001f);
    std::vector<int> noct;
    noct.push_back(8);
    noct.push_back(35);
    noct.push_back(35);
    noct.push_back(8);
    std::vector<int> nsca;
    nsca.push_back(12);
    nsca.push_back(40);
    nsca.push_back(40);
    nsca.push_back(12);
    std::vector<float> mcont;
    mcont.push_back(0.0015f);
    mcont.push_back(0.001f);
    mcont.push_back(0.001f);
    mcont.push_back(0.0015f);
    std::vector<float> rad;
    rad.push_back(0.015f);
    rad.push_back(0.015f);
    rad.push_back(0.015f);
    rad.push_back(0.009f);
    std::vector<float> rsearch;
    rsearch.push_back(0.10f);
    rsearch.push_back(0.15f);
    rsearch.push_back(0.10f);
    rsearch.push_back(0.10f);  
  */
  
  // CARGAMOS LOS FICHEROS PCD EN UNA NUBE DE PUNTOS Y 
  // EN UN VECTOR DE NUBES DE PUNTOS
  
  loadPCDs(scene,objects_vector);
  
  // ELIMINAMOS LOS PUNTOS NAN DE LAS 
  // NUBES DE PUNTOS DE LA ESCENA Y
  // DEL VECTOR
  
  removeNaN(scene);
  for(int i = 0; i < objects_vector.size(); i++)
    removeNaN(objects_vector[i]);
  /*
   * SEGMENTAMOS LA ESCENA PARA
   * ELMINAR LOS PLANOS PRINCIPALES
   */
  segmentCloud(scene);
  /*
   * PASAMOS LA ESCENA A UN DETECTOR DE KEYPOINTS
   * EN ESTE CASO EL SIFT
   */
  
  /*
   * AHORA  APLICAMOS LA TRANSFORMACION A LOS OBJETOS
   * PARA MOSTRARLOS EN LA ESCENA
   */
  for(int i = 0; i<objects_vector.size();i++){
    Eigen::Matrix4f tmp;
    pcloudPtr<colorPoint3D> transformed (new pcloud<colorPoint3D>);
    pcl::transformPointCloud(*objects_vector[i],*transformed,objects_transformation_vector[i]);
    /*
     *REFINAMOS LOS RESULTADOS CON ICP
     */
    ICP(transformed,scene,tmp);
    pcl::transformPointCloud(*transformed,*transformed,tmp);
    pcl::visualization::PCLVisualizer viewer("PCL Viewer");
    pcl::visualization::PointCloudColorHandlerCustom<colorPoint3D> cloud_color_handler (transformed, 255, 0, 0);
    viewer.setBackgroundColor( 0.0, 0.0, 0.0 );
    viewer.addPointCloud(scene, "cloud");
    viewer.addPointCloud(transformed, cloud_color_handler, "objeto");
    while(!viewer.wasStopped () ){
      viewer.spinOnce ();
    }
  }

}


int main(int argc,char** argv){
  int ret;
  while (ros::ok())
  {
    try{
      ret = main_f(argc,argv);
    }catch(std::exception& e){
      std::cerr<<e.what()<<std::endl;
      ret = -1;
    }
  }
  return ret;
}