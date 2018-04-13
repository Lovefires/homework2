setwd("C:\\Users\\Administrator\\Desktop\\Building_Permits")
library("arules")
data = read.transactions("preprocess_Building_Permits.csv", format = "basket", sep = ",", rm.duplicates=TRUE)

#得到频繁项集并保存
frequency = eclat(data, parameter = list(support = 0.05, maxlen = 6))
write(frequency, file = "frequency.csv", sep = ",", quote = TRUE, row.names = FALSE)

#查看频繁项集
inspect(frequency)
inspect(sort(frequency)[1:10])  #前10的频繁项集

#使用apriori算法得到关联规则
rules = apriori(data, parameter = list(support = 0.1, confidence = 0.8, minlen = 2))
summary(rules)
inspect(rules[1:10])
write(rules, file = "relation_rule.csv", sep = ",", row.names = FALSE)

#根据Lift对关联结果降序排序，并查看前10项
rules.sorted = sort(rules, decreasing = TRUE, by = "lift")
inspect(rules.sorted[1:10])
write(rules.sorted, file = "sort_by_lift.csv", sep =",", row.names = FALSE)
