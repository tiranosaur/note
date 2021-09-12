from sqlalchemy.future import create_engine
from sqlalchemy.orm import Session


# engine = create_engine("mysql+mysqldb://root:pass@23.92.23.113/mydb")
from model.user import User

engine = create_engine("mysql+pymysql://png:png@localhost:3306/png")
session = Session(bind=engine)


for user in session.query(User).all():
    print(user.id, user.name)
