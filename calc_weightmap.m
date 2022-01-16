function [WMAP] = calc_weightmap(LMAP)

sum_levelmap = zeros(size(LMAP{1}));
for k = 1:length(LMAP)
    levelmap = LMAP{k};
    sum_levelmap = sum_levelmap + levelmap;
end

for k = 1:length(LMAP)
    levelmap = LMAP{k};
    weightmap = levelmap ./ sum_levelmap;
    WMAP{k} = weightmap;
end
end