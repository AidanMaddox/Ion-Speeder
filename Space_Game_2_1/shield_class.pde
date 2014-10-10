class Shield {
  void display() {
    for (int i = 0; i<playerS; i++) {
      fill(0, 100, 255);
      stroke(0, 100, 255);
      rect(650+(i*2), 10, 2, 10);
    }
  }
}

