function test_broyden2D_robot()
  % This fcn tests broyden2D using the robot arm function
  % discussed in class.

  global params
  params.l1 = 3;
  params.l2 = 3;
  params.x = 4;
  params.y = 4;

  startpt = [1.1; 2.2];  % Converges to [1.1252; 2.4619]

  theta = broyden2D(@f, @J, startpt, 1e-5);

  fprintf('theta1 = %f rad,  theta2 = %f rad\n', theta(1), theta(2));
  fprintf('theta1 = %f deg,  theta2 = %f deg\n', rad2deg(theta(1)), rad2deg(theta(2)));

end

function thetaout = rad2deg(thetain)
  thetaout = (thetain/pi)*180;
end

