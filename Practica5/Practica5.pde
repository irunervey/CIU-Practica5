import shapes3d.*;
import shapes3d.contour.*;
import shapes3d.org.apache.commons.math.*;
import shapes3d.org.apache.commons.math.geometry.*;
import shapes3d.path.*;
import shapes3d.utils.*;


float ax, ay, az;
LatheStock[] figuras;
mesa table;
mesa patas;
camara cam;
boolean mode, menu;
float [] movimientoCamara, rotarCamara, posiciones;
float zcamerai;
String opciones;

void setup(){  
  size(300, 300, P3D);
  textSize(14);
  textAlign(CENTER, CENTER);
  prepararFiguras();
  zcamerai=600;
  movimientoCamara=new float[]{0,0,0};
  rotarCamara=new float[]{0,0};
  posiciones=new float[]{0,0,0,0,0};
  cam=new camara(width/2,height/2,zcamerai);
  mode=false;
  opciones="Pulsa ESC para salir del menu\nPulsa c para cambiar entre el modo camara y camara\nPulsa las flechas para girar la vista de la camara\nEl espacio asciende la camara mientras que el SHIFT la desciende\n"+
                    "La camara se depsplaza hacia delante con w y hacia atras con s\nEl desplazamiento lateral funciona con a y d\nCon z reinicias el giro de la vista de la nave y con r reinicias la posicion de la nave\nHay que tener en cuenta que los desplazamientos se originan en los ejes del plano";
  textSize(18);
  fill(200,255,0);
}

void prepararFiguras(){
  PVector[] m = new PVector[] {
    new PVector(0, 85), 
    new PVector(40, 135), 
    new PVector(60, 20), 
    new PVector(30, 0),
    new PVector(0, 20), 
  };
  figura manzana=new figura(m,"manzana.jpg");  
  table=new mesa(400,30,200,"madera.jpg");
  patas=new mesa(30,300,30,"madera.jpg");
  figuras=new LatheStock[]{manzana.getFigure()};
  
}

void draw() {
  background(60);
  posiciones=cam.movimiento();
  
  if(mode){
    if(menu){
    //camera(width/2.0,height/2.0,900,width/2.0,height/2,0,0,1,0);
    
      
      
      pushMatrix();
      translate(posiciones[3],posiciones[4]-200,posiciones[5]+200);
      text(opciones,0,0);
      popMatrix();
    }
    for (int i = 0;i<3;i++){
      cam.acelerar(movimientoCamara[i],i);
      
      
      if(i<2){
        cam.girar(rotarCamara[i],i);
      }
    }
    
    camera(posiciones[0],posiciones[1],posiciones[2],posiciones[3],posiciones[4],posiciones[5],0,1,0);
  }else{
      camera(width/2.0-80,height/2.0-200,zcamerai,width/2.0,height/2,0,0,1,0);
      if(menu){
        text(opciones,width/2.0,height/2-200,0);
      }
  }
  translate(width/2.0-20, height/2.0-60);
  pushMatrix();
  
  // The next few lines rotate the graphics 
  // context so we view the shape from dfiierent 
  // angles making it appear to be tumbling.

  // Render the shape on the main display area
  translate(-20, -60);
  figuras[0].draw(getGraphics());
  popMatrix();
  pushMatrix();
  translate(20, 50);
  table.getShape().draw(getGraphics());
  pushMatrix();
  translate(185,150,85);
  patas.getShape().draw(getGraphics());
  translate(0,0,-170);
  patas.getShape().draw(getGraphics());
  pushMatrix();
  translate(-370,0,0);
  patas.getShape().draw(getGraphics());
  pushMatrix();
  translate(0,0,170);
  patas.getShape().draw(getGraphics());
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
}


void keyReleased(){
  if(key=='a'||key=='A'){
      movimientoCamara[0]=0.0;
      cam.pararAceleracion(0);
    }
    if(key=='d'||key=='D'){
      movimientoCamara[0]=0.0;
      cam.pararAceleracion(0);
    }
    if(key=='w'||key=='W'){
      movimientoCamara[2]=0.0;
      cam.pararAceleracion(2);
    }
    if(key=='s'||key=='S'){
      movimientoCamara[2]=0.0;
      cam.pararAceleracion(2);
    }
    if(key=='x'||key=='X'){
      cam.parar();
    }
    if(key==' '){
        movimientoCamara[1]=-0.0;
        cam.pararAceleracion(1);
    }
    if(key=='z'||key=='Z'){
      cam.reiniciarCamara();
    }
    if(key == CODED){
      if(keyCode==UP){
         rotarCamara[1]=0.0;
      }
      if(keyCode==DOWN){
         rotarCamara[1]=0.0;
      }
      if(keyCode==LEFT){
         rotarCamara[0]=0.0;
      }
      if(keyCode==RIGHT){
         rotarCamara[0]=0.0;
      }
      if(keyCode==SHIFT){
          movimientoCamara[1]=0.0;
          cam.pararAceleracion(1);
      }
    }
}

void keyPressed(){
  if(key==ESC){
    key=0;
    if(menu){
        menu=false;
      }else{
        menu=true;
      }
  }
    if(key=='c'||key=='C'){
      if(mode){
        mode=false;
      }else{
        mode=true;
      }
    }
    if(mode){
      if(key=='a'||key=='A'){
        movimientoCamara[0]=-0.1;
      }
      if(key=='d'||key=='D'){
        movimientoCamara[0]=0.1;
      }
      if(key=='w'||key=='W'){
        movimientoCamara[2]=-0.1;
      }
      if(key=='s'||key=='S'){
        movimientoCamara[2]=0.1;
      }
      if(key==' '){
        movimientoCamara[1]=-0.1;
      }
      if(key=='r'||key=='R'){
        cam.desplazar(width/2,height/2,zcamerai);
      }
      if(key == CODED){
        if(keyCode==UP){
           rotarCamara[1]=-1.0;
        }
        if(keyCode==DOWN){
           rotarCamara[1]=1.0;
        }
        if(keyCode==LEFT){
           rotarCamara[0]=-1.0;
        }
        if(keyCode==RIGHT){
           rotarCamara[0]=1.0;
        }
        if(keyCode==SHIFT){
          movimientoCamara[1]=0.1;
        }
      }
    
  }
}
