function roots = quadformula(a,b,c)
% Make sure that you also avoid the division-by-zero error that occurs in the special case
if a == 0
    if b ~= 0
        root = -c/b;
        roots = [root];
        disp('Linear Function with One Real Root')
        % Plot for Linear Function when "a" = 0
        x = linspace(-10,10,200);
        y = b*x + c;
        figure
        plot(x, y, '-');
        hold on
        plot(roots, b*roots + c, 'ro');
        hold off
        title(['Linear: ', num2str(b),'*x + ',num2str(c)])
        xlabel('x')
        ylabel('y')
        % Display the roots
disp('Roots:')
disp(roots)
    else
        if c == 0
            disp('Constant Zero. Infinite Solutions.')
            roots = [];
        else
            disp('Constant Non-Zero. No Solutions.')
            roots = [];
        end
    end
else
% Initialization
D = b^2 - 4*a*c;
root1 = 0;
root2 = 0;
roots = [];
% Cases
if D > 0
    % Modify your code to automatically determine when to use the "usual" and "alternate” quadratic formulas, 
    % and hence obtain the most accurate possible floating-point
    % approximation of the roots for any values of the coefficients a,b,c.
    if b >= 0
        root1 = (-b - sqrt(D)) /(2*a);
        root2 = -2*c /(b+sqrt(D));
    else
        root2 = (-b + sqrt(D)) /(2*a);
        root1 = -2*c / (b-sqrt(D));
    end
    roots = [root1, root2];
    disp('Two Distinct Real Roots.')
elseif D == 0
    % (a) there is a single real root and the function should return a
    % single real value (a vector of length one).
    root1 = -b/(2*a);
    roots = [root1];
    disp('One Real Root.')
else
    % (b) there are two complex roots, and the a x2 + bx + c = 0 function 
    % returns an empty result [] (a vector of length zero).
    disp('Two Complex Roots.')
end
% Display the roots
disp('Roots:')
disp(roots)
% Range for Plots
roots = real(roots);
if isempty(roots)
    x = -10:0.01:10; % For Complex
else
    min_root = min(roots);
    max_root = max(roots);
    padding = abs(max_root - min_root) / 2; % Padding to make the Graphs look cleaner
    % Linespace used to create a vector of equally spaced values between
    % two specified endpoints
    x = linspace(min_root - padding, max_root + padding, 200); % Add padding to the Range to make both Roots more Visible
end
y = a*x.^2 + b*x + c; % Quadratic Function
% Plot the Function
figure
plot(x,y,'-')
hold on
if ~isempty(roots)
    plot(roots,a*roots.^2 + b*roots + c,'ro') % Plot the Roots
end
hold off
title(['EQ: ', num2str(a),'*x^2 + ', num2str(b),'*x + ',num2str(c)])
xlabel('x')
ylabel('y')
end
