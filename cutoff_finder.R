library(survival)
library(survminer)
df <- read.csv("your_data.csv")
head(df)
# 计算最佳截断值
res.cut <- surv_cutpoint(
  data = df,
  time = "time",
  event = "status",
  variables = "marker",
  minprop = 0.1  # 限制每组最少10%样本，避免极端cutoff过拟合
)

# 查看最佳截断值
summary(res.cut)
best_cutoff <- res.cut$cutpoint$marker
cat("最佳截断值 =", best_cutoff, "\n")

# 按截断值分组
df$group <- surv_categorize(res.cut, labels = c("low", "high"))

# 绘制KM生存曲线
fit <- survfit(Surv(time, status) ~ group, data = df)
ggsurvplot(fit, data = df, pval = TRUE, risk.table = TRUE, title = "KM curve (optimal cutoff)")
