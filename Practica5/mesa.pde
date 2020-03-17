class mesa {
  float ax, ay, az;
  Box table;
  
  mesa(float ancho, float largo, float profundidad, String textura){
    table = new Box(
    ancho,    // width
    largo,    // height
    profundidad      // depth
    );
    PImage skin = loadImage(textura);
    table
      .use(S3D.ALL) // Apply attribute commands to main tube body only
      .texture(skin).uv(0, 1, 0, 1) // add texture and texture coordinates 
      .drawMode(S3D.TEXTURE);
  }
  Box getShape(){
    return table;
  }
}
