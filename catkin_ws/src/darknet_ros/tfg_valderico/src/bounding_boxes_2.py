from darknet import performDetect as scan #calling 'performDetect' function from darknet.py

def detect(str):
    #''' this script if you want only want get the coord '''
    picpath = str
    cfg='D:/core/darknetAB/cfg/yolov3.cfg' #change this if you want use different config
    coco='D:/core/darknetAB/cfg/coco.data' #you can change this too
    data='D:/core/darknetAB/yolov3.weights' #and this, can be change by you
    test = scan(imagePath=picpath, thresh=0.25, configPath=cfg, weightPath=data, metaPath=coco, showImage=False, makeImageOnly=False, initOnly=False) #default format, i prefer only call the result not to produce image to get more performance

    #until here you will get some data in default mode from alexeyAB, as explain in module.
    #try to: help(scan), explain about the result format of process is: [(item_name, convidence_rate (x_center_image, y_center_image, width_size_box, height_size_of_box))], 
    #to change it with generally used form, like PIL/opencv, do like this below (still in detect function that we create):

    newdata = []
    if len(test) >=2:
        for x in test:
            item, confidence_rate, imagedata = x
            x1, y1, w_size, h_size = imagedata
            x_start = round(x1 - (w_size/2))
            y_start = round(y1 - (h_size/2))
            x_end = round(x_start + w_size)
            y_end = round(y_start + h_size)
            data = (item, confidence_rate, (x_start, y_start, x_end, y_end), w_size, h_size)
            newdata.append(data)

    elif len(test) == 1:
        item, confidence_rate, imagedata = test[0]
        x1, y1, w_size, h_size = imagedata
        x_start = round(x1 - (w_size/2))
        y_start = round(y1 - (h_size/2))
        x_end = round(x_start + w_size)
        y_end = round(y_start + h_size)
        data = (item, confidence_rate, (x_start, y_start, x_end, y_end), w_size, h_size)
        newdata.append(data)

    else:
        newdata = False

    return newdata