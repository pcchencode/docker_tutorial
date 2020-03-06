import pandas as pd


def main():
	lst = ['Geeks', 'For', 'Geeks', 'is', 'portal', 'for', 'Geeks']
	data = pd.DataFrame(lst)
	data.to_csv('/docker_test/data.csv')
	print("file saved.")
	return
	#print(get_href_from_page(board_name=str(Board_Name), scrap_page=int(Scrap_Page)))


if __name__ == '__main__':

	main()

