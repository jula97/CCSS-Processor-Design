import matplotlib.pyplot as plt

x = ['1', '2', '3','4']

y1 = [int(i, 16) for i in ['1058', '08DA', '091A', '051B']]
y2 = [int(i, 16) for i in ['180E', '0CD1', '091A', '094A']]
y3 = [int(i, 16) for i in ['1FC4', '10C8', '0D31', '094A']]
y4 = [int(i, 16) for i in ['277A', '14BF', '1148', '0D79']]
y5 = [int(i, 16) for i in ['2F30', '18B6', '1148', '0D79']]


plt.plot(x, y1, label="4X4 matrix")
plt.plot(x, y2, label="6X4 matrix")
plt.plot(x, y3, label="8X4 matrix")
plt.plot(x, y4, label="10X4 matrix")
plt.plot(x, y5, label="12X4 matrix")

plt.xlabel('No. of cores')
plt.ylabel('Count')
plt.title('Analysis')

plt.legend()

plt.show()
