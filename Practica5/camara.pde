class camara{  
  float velocidad, aceleracionX,aceleracionY,aceleracionZ;
  float x,y,z,zi,gradoVision;
  float [] ojo,rotaciones;
  
  camara(float pos1, float pos2, float pos3){
    velocidad=0;
    aceleracionX=0;
    aceleracionY=0;
    aceleracionZ=0;
    x=pos1;
    y=pos2;
    z=pos3;
    ojo=new float[]{0,0,0};
    zi=z;
    rotaciones=new float[]{0,0};
    gradoVision=0;
  }
  
  void acelerar(float acelera,int eje){
    switch(eje){
      case 0:
        if(aceleracionX*acelera<0){
          aceleracionX=0;
        } else{
          aceleracionX+=acelera;
          if (aceleracionX>10){
            aceleracionX=10;
          }
          if(aceleracionX<-10){
            aceleracionX=-10;
          }
        }
        break;
      case 1:
        if(aceleracionY*acelera<0){
          aceleracionY=0;
        }else{
          aceleracionY+=acelera;
          if (aceleracionY>10){
            aceleracionY=10;
          }
          if(aceleracionY<-10){
            aceleracionY=-10;
          }
        }
        break;
      default:
      if(aceleracionZ*acelera<0){
        aceleracionZ=0;
      }else{
          aceleracionZ+=acelera;
          if (aceleracionZ>10){
            aceleracionZ=10;
          }
          if(aceleracionZ<-10){
            aceleracionZ=-10;
          }
       }
     }
  }
  
  float[] movimiento(){
    x+=aceleracionX;
    y+=aceleracionY;
    z+=aceleracionZ;
    float[] posicion={x,y,z,ojo[0]+x,ojo[1]+y,z-ojo[2]};
    return posicion;
  }
  void girar(float giro,int eje){
    rotaciones[eje]+=giro;
    if(rotaciones[eje]==360)rotaciones[eje]=0;
    if(rotaciones[eje]<0)rotaciones[eje]=360+rotaciones[eje];
    ojo[1]=sin(radians(rotaciones[1]))*1200;
    ojo[0]=sin(radians(rotaciones[0]))*cos(radians(rotaciones[1]))*1200;
    ojo[2]=cos(radians(rotaciones[0]))*cos(radians(rotaciones[1]))*1200;

  }
  void parar(){
    aceleracionX=0;
    aceleracionY=0;
    aceleracionZ=0;
  }
  void pararAceleracion(int eje){
    switch(eje){
      case 0:
        aceleracionX=0;
        break;
      case 1:
        aceleracionY=0;
        break;
      default:
        aceleracionZ=0;
    }
  }
  
  void reiniciarCamara(){
    rotaciones[1]=0;
    rotaciones[0]=0;
  }
  
  float[] getDatos(){
    return new float[]{aceleracionX,aceleracionY,aceleracionZ,rotaciones[0],rotaciones[1]};
  }
  void desplazar(float pos0,float pos1, float pos2){
    y=pos1;
    x=pos0;
    z=pos2;
  }
}
  
