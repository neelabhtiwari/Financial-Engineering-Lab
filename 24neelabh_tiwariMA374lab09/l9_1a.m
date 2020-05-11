%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g


[num] = xlsread('NSEoptiondata.xlsx','29 Dec 11 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 42;
end


% [num] = xlsread('NSEoptiondata.xlsx','30 Jun 11 call');
% [c r] = size(num);
% 
% strike(:,2) = num(:,1);
% settle(:,2) = num(:,3);
% for i = 1:c
%     maturity(i,2) = 36;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','30 Dec 10 call');
% [c r] = size(num);
% 
% strike(:,3) = num(:,1);
% settle(:,3) = num(:,3);
% for i = 1:c
%     maturity(i,3) = 30;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','24 Jun 10 call');
% [c r] = size(num);
% 
% strike(:,4) = num(:,1);
% settle(:,4) = num(:,3);
% for i = 1:c
%     maturity(i,4) = 24;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','31 Dec 09 call');
% [c r] = size(num);
% 
% strike(:,5) = num(:,1);
% settle(:,5) = num(:,3);
% for i = 1:c
%     maturity(i,5) = 18;
% end
% 
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','25 Jun 09 call');
% [c r] = size(num);
% 
% strike(:,6) = num(:,1);
% settle(:,6) = num(:,3);
% for i = 1:c
%     maturity(i,6) = 12;
% end
% 
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','26 Mar 09 call');
% [c r] = size(num);
% 
% strike(:,7) = num(:,1);
% settle(:,7) = num(:,3);
% for i = 1:c
%     maturity(i,7) = 9;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','25 Dec 08 call');
% [c r] = size(num);
% 
% strike(:,8) = num(:,1);
% settle(:,8) = num(:,3);
% for i = 1:c
%     maturity(i,8) = 6;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','25 Sep 08 call');
% [c r] = size(num);
% 
% strike(:,9) = num(:,1);
% settle(:,9) = num(:,3);
% for i = 1:c
%     maturity(i,9) = 3;
% end
% 
% 
% [num] = xlsread('NSEoptiondata.xlsx','28 Aug 08 call');
% [c r] = size(num);
% 
% strike(:,10) = num(:,1);
% settle(:,10) = num(:,3);
% for i = 1:c
%     maturity(i,10) = 1;
% end

%plot3(strike,settle,maturity,'.','MarkerSize',15)

surf(strike,maturity,settle)
xlabel('Strike Price')
ylabel('Maturity')
zlabel('Option Price')
