class Health {
  void display() {
    for (int i = 0; i<=playerH; i++) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      rect(50+(i*2), 10, 2, 10);
    }
  }
}
