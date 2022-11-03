
    //printf("%f %f %f %f\n", b.x, b.y, b.w, b.h);

    int left  = (b.x-b.w/2.)*im.w;
    int right = (b.x+b.w/2.)*im.w;
    int top   = (b.y-b.h/2.)*im.h;
    int bot   = (b.y+b.h/2.)*im.h;

    if(left < 0) left = 0;
    if(right > im.w-1) right = im.w-1;
    if(top < 0) top = 0;
    if(bot > im.h-1) bot = im.h-1;