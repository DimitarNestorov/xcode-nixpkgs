{
  pkgs,
}:

{
  xcode_26 = pkgs.darwin.requireXcode "26_Universal" "sha256-p4INqf85CSIzd7xHRCS9tCigQkOQPKnS/+D5nue3PsY=";
  xcode_26_Apple_silicon = pkgs.darwin.requireXcode "26_Apple_silicon" "sha256-dlfZ2sM6a9pUPdukoMoqvQAj7EEUyj0a/VkXKwkkFT8=";
  xcode_26_0_1 = pkgs.darwin.requireXcode "26.0.1_Universal" "sha256-PsEIjrzxgXFqCWeHs/bsvrlxy8aN899jMhesczMbPfE=";
  xcode_26_0_1_Apple_silicon = pkgs.darwin.requireXcode "26.0.1_Apple_silicon" "sha256-UBDey19uBljjRw84bY4rzxetFEkHiXLEj39Q578jYL8=";
  xcode_26_1 = pkgs.darwin.requireXcode "26.1_Universal" "sha256-SLIn1xAjaYhKGN6EEKslzmVZv+Zoq7QNGdtNreWJ5L8=";
  xcode_26_1_Apple_silicon = pkgs.darwin.requireXcode "26.1_Apple_silicon" "sha256-xFMknk3RxxJi/5IOb2mmw7vyC1xOaY5ZwCZ09AARtJU=";
  xcode_26_1_1 = pkgs.darwin.requireXcode "26.1.1_Universal" "sha256-IkmrerBysM4eqMf/wCQHCBcEL0go/ivFlMpJ4SYQmOU=";
  xcode_26_1_1_Apple_silicon = pkgs.darwin.requireXcode "26.1.1_Apple_silicon" "sha256-5dZ1O7iD2CF8R4TBeBLkaKLe/WOi8CMJJ1/Bg+uitCw=";
  xcode_26_2 = pkgs.darwin.requireXcode "26.2_Universal" "sha256-uCw71PjAuvtKTIpcYsiFSjUZQnIBIpIoOm1QaaYHD7k=";
  xcode_26_2_Apple_silicon = pkgs.darwin.requireXcode "26.2_Apple_silicon" "sha256-YxMVppJwRzTA6xWOILxVjLdl0bNmtZSifG/KQx6inRE=";
  xcode_26_3 = pkgs.darwin.requireXcode "26.3_Universal" "sha256-qrPSc036x3tW1TWWfX10+IS2c08dRCa6KFc+++35ueM=";
  xcode_26_3_Apple_silicon = pkgs.darwin.requireXcode "26.3_Apple_silicon" "sha256-q2p45zqAZUH6Z1Q3DHbZgpuuFTjZoMPhEfFdeIUvclw=";
  xcode_26_4 = pkgs.darwin.requireXcode "26.4_Universal" "sha256-0Cg4Ytu2+JOLEqw1ZZoB6hxFXNA2KriTLwLpT8bmA7I=";
  xcode_26_4_Apple_silicon = pkgs.darwin.requireXcode "26.4_Apple_silicon" "sha256-urkJVqUY6+5z0YiEqCru9M/OneDLAMzdGfOt7i3d1WI=";
}
