from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from pydantic import BaseModel
from .database import get_db, engine
import sqlalchemy

app = FastAPI()

# Allow Frontend to talk to Backend (CORS)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_methods=["*"],
    allow_headers=["*"],
)

class LoginRequest(BaseModel):
    username: str
    password: str

@app.post("/login")
def login(request: LoginRequest, db: Session = Depends(get_db)):
    # Query your 'login' table
    user = db.execute(
        sqlalchemy.text("SELECT * FROM login WHERE Username = :u AND Password = :p"),
        {"u": request.username, "p": request.password}
    ).fetchone()

    if not user:
        raise HTTPException(status_code=401, detail="Invalid Credentials")
    
    return {"status": "success", "message": f"Welcome {user.Username}", "role": user.Role}

@app.get("/movies")
def get_movies(db: Session = Depends(get_db)):
    movies = db.execute(sqlalchemy.text("SELECT * FROM content")).fetchall()
    return [dict(row._mapping) for row in movies]