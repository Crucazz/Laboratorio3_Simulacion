function createfigure3(X1, Y1, X2, Y2)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'DisplayName','Estanque 1');

% Create plot
plot(X2,Y2,'DisplayName','Estanque 2');

% Create ylabel
ylabel({'y(t)'});

% Create xlabel
xlabel({'Tiempo [s]'});

% Create title
title({'Respuesta del sistema ante un impulso'});

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.671309521868116 0.750555565887027 0.199642859731402 0.0869047637212845]);
