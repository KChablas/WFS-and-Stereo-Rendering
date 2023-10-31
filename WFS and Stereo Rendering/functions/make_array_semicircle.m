function x02 = make_array_semicircle(conf)
conf.secondary_sources.geometry = 'circle';
conf.secondary_sources.size = 2.28;
conf.secondary_sources.number = 42;

conf.secondary_sources.x0 = [];
x0 = secondary_source_positions(conf);
x01 = x0(4:19,:);

x02 = [x01(5,:);x01(12,:);x01(1,:);x01(2,:);x01(3,:);
    x01(4,:);x01(6,:);x01(7,:);x01(8,:);x01(9,:);x01(10,:);
    x01(11,:);x01(13,:);x01(14,:);x01(15,:);x01(16,:);];