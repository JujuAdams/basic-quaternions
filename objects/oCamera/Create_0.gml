//Mouse lock variables (press F3 to lock the mouse and use mouselook)
mouseLock = false;
mouseLockTimer = 0;

//Some variables to track the camera
camX     = 450;
camY     = 230;
camZ     = 200;
camYaw   = 120;
camPitch = -45;
camDX    =  dcos(camYaw)*dcos(camPitch);
camDY    = -dsin(camYaw)*dcos(camPitch);
camDZ    =  dsin(camPitch);

//F1 toggles the info panel
showInfo = true;