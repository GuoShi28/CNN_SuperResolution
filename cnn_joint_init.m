function net = cnn_joint_init(opts)

net.layers = {} ;
filters_num1=96;
filters_num2=48;
% Block 1
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.1*randn(9,9,3,filters_num1, 'single'), zeros(1, filters_num1, 'single')}}, ...
                           'weights_depth', {{0.1*randn(9,9,1,filters_num1, 'single'), zeros(1, filters_num1, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'stride_depth', 1, ...
                           'pad_depth', 2, ...
                           'learningRate', 1e-4 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;
net.layers{end+1} = struct('type', 'relu') ;

% Block 2
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.1*randn(1,1,filters_num1,filters_num2, 'single'), zeros(1,filters_num2,'single')}}, ...
                           'weights_depth', {{0.1*randn(1,1,filters_num1,filters_num2, 'single'), zeros(1,filters_num2,'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'stride_depth', 1, ...
                           'pad_depth', 2, ...
                           'learningRate', 1e-4 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;
                       
net.layers{end+1} = struct('type', 'relu') ;

%Block 3
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.001*randn(5,5,filters_num2,1, 'single'), zeros(1,1,'single')}}, ...
                           'weights_depth', {{0.001*randn(5,5,filters_num2,1, 'single'), zeros(1,1,'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'stride_depth', 1, ...
                           'pad_depth', 2, ...
                           'learningRate', 1e-4 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;

filters_num3=64;
filters_num4=32;
% Block 4
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.1*randn(9,9,2,filters_num3, 'single'), zeros(1, filters_num3, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'learningRate', 1e-4 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;
net.layers{end+1} = struct('type', 'relu') ;

% Block 5
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.1*randn(1,1,filters_num3,filters_num4, 'single'), zeros(1,filters_num4,'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'learningRate', 1e-4 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;
                       
net.layers{end+1} = struct('type', 'relu') ;

% Block 6
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{0.001*randn(5,5,filters_num4,1, 'single'), zeros(1,1,'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'learningRate', 1e-5 * ones(1, 2, 'single'), ...
                           'weightDecay', zeros(1, 2, 'single')) ;


% Loss layer
net.layers{end+1} = struct('type', 'RESMSEloss') ;