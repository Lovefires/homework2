setwd("C:\\Users\\Administrator\\Desktop\\Building_Permits")

data = read.csv('Building_Permits.csv', header = T)

# 挑选的用于关规则挖掘的属性有：
# Permit.Type,  Street.Number, Unit, Current.Status, Number.of.Existing.Stories,  
# Number.of.Proposed.Stories, Estimated.Cost, Revised.Cost, Existing.Units,
# Proposed.Units,Existing.Construction.Type, 
# Proposed.Construction.Type, Supervisor.District 

library("dplyr")
data = select(data, Permit.Type,  Street.Number, Unit, Current.Status, 
Number.of.Existing.Stories, Number.of.Proposed.Stories, Estimated.Cost, Revised.Cost, 
Existing.Units, Proposed.Units, Existing.Construction.Type, 
Proposed.Construction.Type, Supervisor.District )

# 对缺失数据进行删除处理
data <- na.omit(data)
View(data)

#Permit Type属性总共有8种类型，分别为1~8， 保持不变
data[data$Permit.Type == '1', 'Permit.Type'] = 'Permit type1'
data[data$Permit.Type == '2', 'Permit.Type'] = 'Permit type2'
data[data$Permit.Type == '3', 'Permit.Type'] = 'Permit type3'
data[data$Permit.Type == '4', 'Permit.Type'] = 'Permit type4'
data[data$Permit.Type == '5', 'Permit.Type'] = 'Permit type5'
data[data$Permit.Type == '6', 'Permit.Type'] = 'Permit type6'
data[data$Permit.Type == '7', 'Permit.Type'] = 'Permit type7'
data[data$Permit.Type == '8', 'Permit.Type'] = 'Permit type8'


#Street Number属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Street.Number))
data[num >= 0 & num <10, 'Street.Number'] = 'few streets'
data[num >= 10 & num <100, 'Street.Number'] = 'some streets'
data[num >= 100 & num <1000, 'Street.Number'] = 'many streets'
data[num >= 1000, 'Street.Number'] = 'plenty streets'

#Unit属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Unit))
data[num >= 0 & num <10, 'Unit'] = 'few units'
data[num >= 10 & num <100, 'Unit'] = 'some units'
data[num >= 100 & num <1000, 'Unit'] = 'many units'
data[num >= 1000, 'Unit'] = 'plenty units'

#Current.Status属性总共有14种类型，保持不变

#Number.of.Existing.Stories属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Number.of.Existing.Stories))
data[num >= 0 & num <5, 'Number.of.Existing.Stories'] = 'few existing stories'
data[num >= 5 & num <20, 'Number.of.Existing.Stories'] = 'some existing stories'
data[num >= 20 & num <50, 'Number.of.Existing.Stories'] = 'many existing stories'
data[num >= 50, 'Number.of.Existing.Stories'] = 'plenty existing stories'

#Number.of.Proposed.Stories属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Number.of.Proposed.Stories))
data[num >= 0 & num <5, 'Number.of.Proposed.Stories'] = 'few proposed stories'
data[num >= 5 & num <20, 'Number.of.Proposed.Stories'] = 'some proposed stories'
data[num >= 20 & num <50, 'Number.of.Proposed.Stories'] = 'many proposed stories'
data[num >= 50, 'Number.of.Proposed.Stories'] = 'plenty proposed stories'

#Estimated.Cost属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Estimated.Cost))
data[num >= 0 & num <1000, 'Estimated.Cost'] = 'few estimates cost'
data[num >= 1000 & num <10000, 'Estimated.Cost'] = 'some estimates cost'
data[num >= 10000 & num <100000, 'Estimated.Cost'] = 'many estimates cost'
data[num >= 100000, 'Estimated.Cost'] = 'plenty estimates cost'

#Revised.Cost属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Revised.Cost))
data[num >= 0 & num <1000, 'Revised.Cost'] = 'few revised stories'
data[num >= 1000 & num <10000, 'Revised.Cost'] = 'some revised stories'
data[num >= 10000 & num <100000, 'Revised.Cost'] = 'many revised stories'
data[num >= 100000, 'Revised.Cost'] = 'plenty revised stories'

#Existing.Units属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Existing.Units))
data[num >= 0 & num <1000, 'Existing.Units'] = 'few existing units'
data[num >= 1000 & num <10000, 'Existing.Units'] = 'some existing units'
data[num >= 10000 & num <100000, 'Existing.Units'] = 'many existing units'
data[num >= 100000, 'Existing.Units'] = 'plenty existing units'

#Proposed.Units属性用few, some, many 和 plenty表示
num = as.numeric(as.character(data$Proposed.Units))
data[num >= 0 & num <1000, 'Proposed.Units'] = 'few proposed units'
data[num >= 1000 & num <10000, 'Proposed.Units'] = 'some proposed units'
data[num >= 10000 & num <100000, 'Proposed.Units'] = 'many proposed units'
data[num >= 100000, 'Proposed.Units'] = 'plenty proposed units'

#Existing.Construction.Type属性，用1~5表示
data[data$Existing.Construction.Type == '1', 'Existing.Construction.Type'] = 'existing construction type1'
data[data$Existing.Construction.Type == '2', 'Existing.Construction.Type'] = 'existing construction type2'
data[data$Existing.Construction.Type == '3', 'Existing.Construction.Type'] = 'existing construction type3'
data[data$Existing.Construction.Type == '4', 'Existing.Construction.Type'] = 'existing construction type4'
data[data$Existing.Construction.Type == '5', 'Existing.Construction.Type'] = 'existing construction type5'

#Proposed.Construction.Type属性，用1~5表示
data[data$Proposed.Construction.Type == '1', 'Proposed.Construction.Type'] = 'proposed construction type1'
data[data$Proposed.Construction.Type == '2', 'Proposed.Construction.Type'] = 'proposed construction type2'
data[data$Proposed.Construction.Type == '3', 'Proposed.Construction.Type'] = 'proposed construction type3'
data[data$Proposed.Construction.Type == '4', 'Proposed.Construction.Type'] = 'proposed construction type4'
data[data$Proposed.Construction.Type == '5', 'Proposed.Construction.Type'] = 'proposed construction type5'

#Supervisor.District属性，用few,some,many,plenty表示
num = as.numeric(as.character(data$Supervisor.District))
data[num >= 0 & num <1000, 'Supervisor.District'] = 'few districts'
data[num >= 1000 & num <10000, 'Supervisor.District'] = 'some districts'
data[num >= 10000 & num <100000, 'Supervisor.District'] = 'many districts'
data[num >= 100000, 'Supervisor.District'] = 'plenty districts'

View(data)

write.csv(data, file = "preprocess_Building_Permits.csv", row.names = F)
