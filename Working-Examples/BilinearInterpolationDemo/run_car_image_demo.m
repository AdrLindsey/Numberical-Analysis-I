function run_car_image_demo( )
  % This runs the necessary stuff to create the car image demo.
  % It read an input image called A.  The program then creates two new images:
  % 1.  The first is a 2x interpolation of the original image A.  This is
  %     image B.
  % 2.  The second image is a 2x interpolation of image B.  This
  %     is image C.  Therefore, image C
  %     is a 4x interpolation of the input image A.
  % Note that the image is an RGB image, with three color planes.

  % Read in original image A.  Cast to double so I can do 
  % floating point operations throughout all processing.
  A = double(imread('BWCar_halfsize.png'));
  
  figure(1)  
  colormap('gray');
  image(A/256);
  title('Original image')
  

  % Allocate array B -- twice the size as A.
  s = size(A);
  B = zeros(2*s(1)-1, 2*s(2)-1, 3); 
  
  % Do interpolation on each color plane to create B
  for colorplane = 1:3
      B(:,:,colorplane) = interpolate_image_2x(A(:,:,colorplane));
  end

  % Plot out image B
  figure(2)
  colormap('gray')
  image(B/256);
  title('After 2x interpolation')

  
  % Now allocate array C -- four times the size of A.
  C = zeros(4*s(1)-3, 4*s(2)-3, 3); 
  
  % Do interpolation on each color plane
  for colorplane = 1:3
    C(:,:,colorplane) = interpolate_image_4x(A(:,:,colorplane));
  end

  % Plot out image C
  figure(3)
  colormap('gray')
  image(C/256);
  title('After 4x interpolation')

  % Now allocate array D -- eight times the size of A.
  D = zeros(8*s(1)-7, 8*s(2)-7, 3); 
  
  % Do interpolation on each color plane
  for colorplane = 1:3
      D(:,:,colorplane) = interpolate_image_8x(A(:,:,colorplane));
  end

  % Plot out image D
  figure(4)
  colormap('gray')
  image(D/256);
  title('After 8x interpolation')


end

