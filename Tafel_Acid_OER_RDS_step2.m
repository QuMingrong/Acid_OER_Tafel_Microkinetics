clc; clear;

% === 常数定义 ===
F = 96485;              % 法拉第常数 (C/mol)
R = 8.314;              % 气体常数 (J/mol/K)
T = 298;                % 温度 (K)
f = F / (R * T);        % F/RT ≈ 38.94
alpha = 0.5;            % 电荷转移系数
n = 1;                  % 电子转移数
A = 1;                  % 电极面积 (cm^2)

% === 活度 ===
a_H3O = 0.1;            % 0.1 M HClO4
a_H2O = 1;              % 默认为1

% === 速率常数（可调节模拟不同催化剂）===
K1_0 = 1e2;             % k1 / k-1
k2   = 1e7;             

% === 扫描过电位 η ===
eta = linspace(-0.8, 1, 9000);    % 单位：V
eta1 = eta;
eta2 = eta;
eta3 = eta;

% === 分母表达式 D(η) ===
D = a_H3O + K1_0 .* exp(f .* eta1);

% === θ_M–OH*（θ1）===
theta1 = (K1_0 .* exp(f .* eta1)) ./ D;

% === θ_M*（θ0）===
theta0 = a_H3O .* (K1_0 .* exp(f .* eta1)) ./ D ./ (K1_0 .* exp(f .* eta1));

% === 电流密度表达式 J = nF r_3 ===
numer = K1_0 .* k2 .* exp(f .* eta1) .* exp((1 - alpha) .* f .* eta2);
I = n * F * A .* numer ./ D;     % 电流 (mA)
j = I ./ A;                      % 电流密度 (mA/cm²)

% === 有效值过滤 ===
valid = ~isnan(j) & ~isinf(j) & j > 0;
eta = eta(valid);
j = j(valid);
theta0 = theta0(valid);
theta1 = theta1(valid);

% === 检查总覆盖度误差 ===
fprintf('最大θ总和误差：%.2e\n', max(abs(theta0 + theta1 - 1)));

% === 绘图 ===
figure;
yyaxis left
plot(log10(j), eta, 'k', 'LineWidth', 2);
ylabel('\eta / V');
xlabel('log_{10}|j| / mA cm^{-2}');
ylim([0, 0.8]);

yyaxis right
plot(log10(j), theta0, '--', 'Color', [1 0 1], 'LineWidth', 1.5); hold on;
plot(log10(j), theta1, '--', 'Color', [0.5 0 1], 'LineWidth', 1.5);
ylabel('\theta_i');
ylim([0 1.05]);

title('Simulated Tafel & Surface Coverage (Step 3 as RDS)');
legend({'Tafel Curve', '\theta_{M^*}', '\theta_{M–OH^*}'}, 'Location', 'northeast');
grid on; box on;
xlim([-7, ceil(log10(max(j))) + 1]);
