#include "ros/ros.h"
#include "std_msgs/String.h"

#include <iostream>
#include <vector>
#include <string>


// Cosas de PCL
#include <pcl/common/common_headers.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/passthrough.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/common/transforms.h>

#include <pcl_conversions/pcl_conversions.h>
#include <pcl/PCLPointCloud2.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>

#include <boost/thread/thread.hpp>
#include <boost/algorithm/string.hpp>
#include <math.h>
#include <vector>


// Mensaje custom con la nube de puntos
#include "tfg_valderico/vectorNubes.h"
#include "tfg_valderico/coordObjetos.h"

int primera_nube = 0; //para probar que solo coja una nube de puntos

using point3D = pcl::PointXYZ;
using colorPoint3D = pcl::PointXYZRGB;


//Mostar nube de UN objeto
void spawnViewer(pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud)
{
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->addCoordinateSystem (1.0);
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGBA> rgb(pointCloud);
    viewer->addPointCloud<pcl::PointXYZRGBA> (pointCloud, rgb, "id0");
    while(!viewer->wasStopped ()) {
		viewer->spinOnce(100);
		boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	}
	viewer->close();
}
void showCloud(pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& cloud)
{
	// Abrir un visualizador que muestre la nube filtrada
	boost::thread visualizer = boost::thread(spawnViewer, cloud);
	cout << "Pulsa para continuar" << endl;
	cin.get();
	visualizer.interrupt();
	visualizer.join();
}

//Mostar nubes de DOS objetos
void spawnViewer2(pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud1, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud2)
{
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->addCoordinateSystem (1.0);
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGBA> rgb1(pointCloud1);
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZRGBA> rgb2(pointCloud2, 255, 0, 0);
    viewer->addPointCloud<pcl::PointXYZRGBA> (pointCloud1, rgb1, "id0");
	viewer->addPointCloud<pcl::PointXYZRGBA> (pointCloud2, rgb2, "id1");
    while(!viewer->wasStopped ()) {
		viewer->spinOnce(100);
		boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	}
	viewer->close();
}

void showCloud2(pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& cloud1, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& cloud2)
{
	// Abrir un visualizador que muestre la nube filtrada
	boost::thread visualizer = boost::thread(spawnViewer2, cloud1, cloud2);
	cout << "Pulsa para continuar" << endl;
	cin.get();
	visualizer.interrupt();
	visualizer.join();
}

//Mostar nubes de un vector objetos
void spawnViewer3(std::vector <pcl::PointCloud<pcl::PointXYZRGBA>::Ptr> vectorObjetos)
{
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor( 0.0, 0.0, 0.0 );

	viewer->addCoordinateSystem (1.0);
	char letra = 'a';
	// Para cada objeto añadimos un poinCloudColorHandler y lo añadimos
	for(int i = 0; i < vectorObjetos.size(); i++){
		pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGBA> rgb(vectorObjetos[i]);
   		viewer->addPointCloud<pcl::PointXYZRGBA> (vectorObjetos[i], rgb, &letra);
		letra++;
	}

	
    while(!viewer->wasStopped ()) {
		viewer->spinOnce(100);
		boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	}
	viewer->close();
}

void showCloud3(std::vector <pcl::PointCloud<pcl::PointXYZRGBA>::Ptr>& vectorObjetos)
{
	// Abrir un visualizador que muestre la nube filtrada
	boost::thread visualizer = boost::thread(spawnViewer3, vectorObjetos);
	cout << "Pulsa para continuar" << endl;
	cin.get();
	visualizer.interrupt();
	visualizer.join();
}

///////////////////////////////////////////////////////////////
// Funciones auxiliares para procesamiento de la nube de puntos
///////////////////////////////////////////////////////////////

//Aplicar voxelgrid de tamaño leaf en las 3 dimensiones
void applyVoxelGrid(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud, const double& leaf)
{
	// Aplicar voxel grid con un tamanyo de hoja "leaf"
	cout << "Nube antes de aplicar voxel grid " << inputCloud->points.size() << endl;
	cout << "Aplicando VoxelGrid..." << endl;
	pcl::VoxelGrid<pcl::PointXYZRGBA> voxelgrid_filter;
	voxelgrid_filter.setInputCloud (inputCloud);			// nube de origen
	voxelgrid_filter.setLeafSize (leaf, leaf, leaf);		// tamanyo del voxel
	voxelgrid_filter.filter (*outputCloud);		// ejecutar el filtrado y guardar el resultado
	// Obtener el numero de puntos de la nube filtrada
	cout << "Nube tras aplicar voxel grid " << outputCloud->points.size() << endl;
}

//Generar matriz de traslación
Eigen::Affine3f generateTranslationMatrix(const Eigen::Vector3f& trans)
{
	//Transformación de translación
	Eigen::Affine3f transform(Eigen::Affine3f::Identity());
	//Construir translación
	transform.translation() = trans;
	return transform;
}

//Aplicar translación
void applyTranslation(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& trans)
{
	//Transformación de translación
	Eigen::Affine3f transform = generateTranslationMatrix(trans);	
	std::cout << "Aplicando traslación..." << endl;
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

//Aplicar translación inversa
void applyTranslationInv(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& trans)
{
	//Transformación de translación
	Eigen::Affine3f transform = generateTranslationMatrix(trans);	
	transform = transform.inverse();
	
	std::cout << "Aplicando traslación inversa..." << endl;
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

//Generar matriz de escala
Eigen::Affine3f generateScaleMatrix(const Eigen::Vector3f& scale)
{
	// Construir transformación de escala
	Eigen::Affine3f transform(Eigen::Affine3f::Identity());
	transform = Eigen::Scaling(scale);
	return transform;
}

//Aplicar escala
void applyScaling(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& scale)
{
	// Construir transformación de escala
	Eigen::Affine3f transform = generateScaleMatrix(scale);
	//Mostrar transformación
	std::cout << "Aplicando escala..." << endl;
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

//Aplicar escala inversa
void applyScalingInv(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& scale)
{
	// Construir transformación de escala
	Eigen::Affine3f transform = generateScaleMatrix(scale);
	transform = transform.inverse();
	
	//Mostrar transformación
	std::cout << "Aplicando escala inversa..." << endl;
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

//Generar matriz de rotación
Eigen::Affine3f generateRotationMatrix(const Eigen::Vector3f& rotation)
{
	// Aplicar transformación de rotación
	Eigen::Affine3f transform(Eigen::Affine3f::Identity());
	//Rotaciones en los 3 ejes (Euler ZYX -> yaw, pitch, roll)
	transform.rotate (Eigen::AngleAxisf (rotation[0], Eigen::Vector3f::UnitZ())); 
	transform.rotate (Eigen::AngleAxisf (rotation[1], Eigen::Vector3f::UnitY()));
	transform.rotate (Eigen::AngleAxisf (rotation[2], Eigen::Vector3f::UnitX()));
	return transform;
}

//Aplicar rotación
void applyRotation(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& rotation)
{
	// Aplicar transformación de rotación
	Eigen::Affine3f transform = generateRotationMatrix(rotation);
	
	std::cout << "Aplicando rotación..." << endl;
	std::cout<<"Ángulos de rotación (Z,Y,X): ("<<rotation[0]<<","<<rotation[1]<<","<<rotation[2]<<")\n";
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

//Aplicar rotación invertida
void applyRotationInv(const pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& inputCloud, pcl::PointCloud<pcl::PointXYZRGBA>::Ptr& outputCloud,
	const Eigen::Vector3f& rotation)
{
	// Aplicar transformación de rotación
	Eigen::Affine3f transform = generateRotationMatrix(rotation);
	transform = transform.inverse();
	
	std::cout << "Aplicando rotación inversa..." << endl;
	std::cout<<"Ángulos de rotación (Z,Y,X): ("<<rotation[0]<<","<<rotation[1]<<","<<rotation[2]<<")\n";
	std::cout<<"Aplicando transformación sobre la superficie: \n"<<transform.matrix()<<std::endl;
	//Aplicar transformación a la nube de puntos
	pcl::transformPointCloud (*inputCloud, *outputCloud, transform);
}

// FIN DE LAS FUNCIONES AUXILIARES


// FUNCION PRINCIPAL DONDE SE LLEVA A CABO LA CREACION DEL MAPA
void callback(tfg_valderico::vectorNubes msg)
{
  /*
  	std::cout<<"Angulo yaw: "<<msg.yaw<<std::endl;
  
  	int tam = msg.coord_objetos.size();

  	for(int i=0; i<tam; i++ ){
		std::cout<<"Objeto nº"<<i<<" :"<<std::endl;
		std::cout<<"clase: "<<msg.coord_objetos[i].clase;
		std::cout<<"\nxmin: "<<msg.coord_objetos[i].xmin<<"\nxmax: "<<msg.coord_objetos[i].xmax<<
		"\nymin: "<<msg.coord_objetos[i].ymin<<"\nymax: "<<msg.coord_objetos[i].ymax<<std::endl;
  	}
    std::cout<<"nube: "<<msg.nube_objetos<<endl;
	*/

	//generamos las nubes de cada uno de los objetos, extrayendolas de la nube principal mediante los datos del bounding box (xmax,xmin,ymax,ymin)
	int tam = msg.coord_objetos.size();

	std::vector <pcl::PointCloud<pcl::PointXYZRGBA>::Ptr> vectorObjetos;


	if(primera_nube==0){
		primera_nube++;

		// Convertimos la nube del tipo sensor_msgspoint::cloud2 a pcl::pointcloud2
		// para poder trabajar con pcl
		pcl::PCLPointCloud2 pcl_pc2;
		pcl_conversions::toPCL(msg.nube_objetos,pcl_pc2);
		pcl::PointCloud<pcl::PointXYZRGBA>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZRGBA>);
		pcl::fromPCLPointCloud2(pcl_pc2,*temp_cloud);


		cout << "Esta nube tiene " << temp_cloud->points.size() << endl;
		cout << "width " << temp_cloud->width << endl;
		cout << "height " << temp_cloud->height << endl;

		//la nube original es:
		//cloud->width    = 1920;
  		//cloud->height   = 1080;

		for(int j = 0; j < tam ; j++){
			//generamos una nueva nube para copiar los datos de los objetos
			pcl::PointCloud<pcl::PointXYZRGBA>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZRGBA>);

			int xmin = msg.coord_objetos[j].xmin;
			int xmax = msg.coord_objetos[j].xmax ;
			int ymin = msg.coord_objetos[j].ymin;
			int ymax = msg.coord_objetos[j].ymax ;
			
			

			int width1 = xmax - xmin;
			int height1 = ymax - ymin;

			std::cout<<"\nxmin: "<<xmin<<"\nxmax: "<<xmax<<"\nymin: "<<ymin<<"\nymax: "<<ymax<<std::endl;
			std::cout<<"\nwidth: "<<width1<<"\nheight: "<<height1<<std::endl;
			
			cloud->width    = width1;
			cloud->height   = height1;
			cloud->is_dense = temp_cloud->is_dense; //false - puede contener valores NaN
			cloud->points.resize (cloud->width * cloud->height);
			// Copiamos los datos de los objetos en la nube nueva
			size_t i=0;
			for(int x=xmin; x < xmax ; x++){
				for(int y=ymin; y < ymax ; y++){
					cloud->points[i].x = temp_cloud->at(x,y).x;
					cloud->points[i].y =  temp_cloud->at(x,y).y;
					cloud->points[i].z  = temp_cloud->at(x,y).z;

					cloud->points[i].r = temp_cloud->at(x,y).r;
					cloud->points[i].g =  temp_cloud->at(x,y).g;
					cloud->points[i].b  = temp_cloud->at(x,y).b;
					cloud->points[i].a  = temp_cloud->at(x,y).a;
					
					i++;
				}
			}

			cout << "El objeto " << i <<" tiene :" << cloud->points.size() << endl;
			//Aplicar voxelgrid con tamaño de hoja 0.05
			//pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud_voxelized (new pcl::PointCloud<pcl::PointXYZRGBA>);
			//applyVoxelGrid(cloud, pointCloud_voxelized, 0.05);

			//Aplicar transformación de rotación
			pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud_rotation(new pcl::PointCloud<pcl::PointXYZRGBA>);
			applyRotation(cloud, pointCloud_rotation, Eigen::Vector3f(0,msg.yaw,0));

			cout << "\n" ;
			//añadimos la nube del objeto al vector que contiene todos los objetos
			//antes de esto habria que voxelizar las nubes

			vectorObjetos.push_back(pointCloud_rotation);
			showCloud(cloud);
		}
		showCloud3(vectorObjetos);

		// Obtener el centroide de la nube
		/*
		Eigen::Vector4f centroid;
		pcl::compute3DCentroid 	(*temp_cloud, centroid);
		cout << "El centroide es \n" << centroid << endl;
		*/

		// Abrir un visualizador que muestre la nube cargada
		//showCloud(temp_cloud);

		//Aplicar voxelgrid con tamaño de hoja 0.05
		// pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud_voxelized (new pcl::PointCloud<pcl::PointXYZRGBA>);
		// applyVoxelGrid(temp_cloud, pointCloud_voxelized, 0.05);

		// Obtener el numero de puntos de la nube filtrada
		// cout << "Esta nube tiene " << pointCloud_voxelized->points.size() << endl;

		// Abrir un visualizador que muestre la nube cargada
		//showCloud(pointCloud_voxelized);

		//Aplicar transformación de rotación
		// pcl::PointCloud<pcl::PointXYZRGBA>::Ptr pointCloud_rotation(new pcl::PointCloud<pcl::PointXYZRGBA>);
		// applyRotation(pointCloud_voxelized, pointCloud_rotation, Eigen::Vector3f(0,msg.yaw,0));

		// Obtener el numero de puntos de la nube
		//cout << "Esta nube tiene " << pointCloud_rotation->points.size() << endl;
		// Abrir un visualizador que muestre la nube cargada
		
		// juntamos la nube original a la girada, para comprobar que funciona bien
		//showCloud2(pointCloud_voxelized, pointCloud_rotation);

	

		//Guardar en disco el resultado
		std::string output = "output.pcd";

		if(pcl::io::savePCDFileASCII (output, *vectorObjetos[0]) == -1)
		{
			std::cerr<<"Error al almacenar la nube de puntos en "+output<<std::endl;
		}
		else
		{
			std::cout<<"Nube de puntos guardada en "<<output<<std::endl;
		}
	}
	
}

int main(int argc, char **argv)
{

    ros::init(argc, argv, "Map_Creator");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("vector_nube", 1000, callback);
    
    while (ros::ok())
    {
      ros::spin();  
    }

  return 0;
}