import datetime
import uuid

import pandas as pd
from connectors_to_databases import PostgreSQL
from faker import Faker

pg = PostgreSQL(
    database="dbt",
)

fake = Faker(locale="ru_RU")

list_of_dict = []
for _ in range(3000):
    dict_ = {
        "id": uuid.uuid4(),
        "created_at": fake.date_time_ad(
            start_datetime=datetime.date(year=2025, month=1, day=1),
            end_datetime=datetime.date(year=2025, month=2, day=1),
        ),
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "middle_name": fake.middle_name(),
        "birthday": fake.date_time_ad(
            start_datetime=datetime.date(year=1980, month=1, day=1),
            end_datetime=datetime.date(year=2005, month=12, day=31),
        ),
        "email": fake.email(),
        "city": fake.city(),
    }

    list_of_dict.append(dict_)

df = pd.DataFrame(data=list_of_dict)

pg.insert_df(
    df=df,
    table_name="users",
)