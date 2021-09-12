import random
import string
from numba import prange, njit
from sqlalchemy.future import create_engine
from sqlalchemy.orm import Session
from model.user import User

# engine = create_engine("mysql+mysqldb://root:pass@23.92.23.113/mydb")
engine = create_engine("mysql+pymysql://png:png@localhost:3306/png")
session = Session(bind=engine)


def id_generator(size=6, chars=string.ascii_uppercase + string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def fill_db(count: int):
    for i in prange(1, count):
        # user = User(id=i, name=id_generator(50))
        user = User(id=i, name=f"""user #{i}""")
        session.add(user)


if session.query(User).count() == 0:
    fill_db(1000)
    session.commit()

user = session.query(User).filter(User.id == 1).first()
user.name = "iOne"
session.commit()

user = session.query(User).filter(User.id == 2).first()
session.delete(user)

users = session.query(User).limit(10)
for user in users:
    print(user.name)
