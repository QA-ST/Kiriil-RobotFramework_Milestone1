import os
import csv

from robot.api.deco import keyword


@keyword
def project_root_directory() -> str:
    return os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))


@keyword
def fetch_row_from_csv(file_path, search_value):
    with open(file_path, mode='r', newline='') as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            if row[1] == search_value:
                return row
    return None
