# 创建一个包含水果名称和对应销量的数据框
fruit_data <- data.frame(
  Fruit = c("Apple", "Banana", "Orange", "Grape"),
  Sales = c(100, 80, 60, 40)
)

# 使用ggplot2包来绘图（如果没有安装需要先安装，安装命令为 install.packages("ggplot2")）
library(ggplot2)

# 绘制柱状图
ggplot(fruit_data, aes(x = Fruit, y = Sales)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Fruit Sales", x = "Fruit Name", y = "Sales Quantity")
