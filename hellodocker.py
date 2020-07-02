import pandas as pd


def main():
	lst = ['Geeks', 'For', 'Geeks', 'is', 'portal', 'for', 'Geeks']
	data = pd.DataFrame(lst)
	# data.to_csv('/tmp/data.csv') # 存入 container 裡面的 tmp 資料夾當中
	data.to_csv('data.csv') # 直接存入 container workdir 裡頭
	print("file saved.")
	print(data)
	print('hello')
	return
	#print(get_href_from_page(board_name=str(Board_Name), scrap_page=int(Scrap_Page)))


if __name__ == '__main__':

	main()

