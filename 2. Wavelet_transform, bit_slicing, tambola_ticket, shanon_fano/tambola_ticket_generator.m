clc;
clear;
close all;

check = false;
while ~check
    matrix = randi([0 1],3,9);
    row_check = all(sum(matrix,2) == 5);
    col_check = all(sum(matrix,1) >= 1);
    
    if row_check && col_check
        check = true;
    end
end

ranges = {1:9, 10:19, 20:29, 30:39, 40:49, 50:59, 60:69, 70:79, 80:90};
ticket = zeros(3,9);

for col = 1:9
    ones_count = sum(matrix(:,col));
    nums = randperm(length(ranges{col}), ones_count);
    nums = ranges{col}(nums);
    nums = sort(nums);
    
    idx = find(matrix(:,col) == 1);
    ticket(idx, col) = nums;
end

% DISPLAY SECTION
disp('Binary Layout Matrix (1 = number present):');
disp(matrix);

disp('Final Tambola Ticket:');
disp(ticket);

% Pretty table format
colNames = {'1-9','10-19','20-29','30-39','40-49','50-59','60-69','70-79','80-90'};
T = array2table(ticket,'VariableNames',colNames);
disp(T);
