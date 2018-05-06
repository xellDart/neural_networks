% Initail Values
MatX = [1 0 1 0 1 0; 1 1 1 0 0 0];
MatY = [1 1 0 0; 1 0 1 0];
[numx, dimx]= size(MatX);
[numy, dimy]= size(MatY);

% Convert to polar MatX
for idx = 1:numel(MatX)
    if (MatX(idx) == 0)
       MatX(idx) = -1;
    end
end
% Convert to polar MatY
for idx = 1:numel(MatY)
    if (MatY(idx) == 0)
       MatY(idx) = -1;
    end
end

%FASE DE ENTRENAMIENTO
tempM = zeros(dimx,dimy);
B = [];
for i = 1:numy
  PatX = MatX(i,:);
  PatY = MatY(i,:);
  B = PatX' * PatY;
  tempM += B;
end 

%FASE DE PRUEBA
test = [1 0 1 0 1 0; 1 1 1 0 0 0];

% Multiplicar vector de prueba por matrix tempM
temp = zeros(numy, dimy);
for pattern = 1:numy
  for x = 1:dimx
    for y = 1:dimy
      temp(pattern, y) += test(pattern, x) * tempM(x,y);
    end
  end
end
temp

for item = 1:numel(temp)
  if (temp(item) < 0)
    temp(item) = 0;
  else
    temp(item) = 1;
  end  
end
result = temp