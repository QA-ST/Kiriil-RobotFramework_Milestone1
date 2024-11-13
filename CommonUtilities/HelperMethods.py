import os
import csv

from robot.api.deco import keyword


@keyword
def project_root_directory() -> str:
    return os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))


def fetch_second_column_from_csvfile(file_path):
    second_column_values = []  # List to store second column values
    with open(file_path, mode='r', newline='') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)
        for row in csv_reader:
            if row and len(row) > 1 and row[1]:  # Ensure the row is not empty and has a second column
                second_column_values.append(row[1])  # Append the second column value to the list

            if len(second_column_values) == 50:  # Stop after 51 entries
                break

    return second_column_values
