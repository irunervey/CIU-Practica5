
class figura {

LatheStock shape;

   figura(PVector[] v,String textura) {
    
  
    // The control points to be used for the lathe surface 
    
    // Use a Bezier curve path to define the lathe surface path for the tube
    Path path = new BCurve3D(v, 30);
    // Create the lathe surface
    LatheSurface surface = new LatheSurface(path, 30);
    // Create the lathe stock (vase)
    shape = new LatheStock(surface);
    shape.tag = "Vase";
    // Apply the rendering attributes
    PImage skin = loadImage(textura);
    skin = Image.rotateCCW(skin); // rotate image 90 degreess
  
    shape
      .use(S3D.ALL) // Apply attribute commands to main tube body only
      .texture(skin).uv(0, 1, 0, 1) // add texture and texture coordinates 
      .drawMode(S3D.TEXTURE); // set the drawining mode
  }
  LatheStock getFigure(){
    return shape;
  }
  
}
