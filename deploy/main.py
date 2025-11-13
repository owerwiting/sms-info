from fastapi import FastAPI, UploadFile, File, Request
from fastapi.responses import JSONResponse
import os, pathlib, uuid

app = FastAPI(title="SMS Service API")

@app.get("/health")
def health():
    return {"ok": True}

@app.post("/api/imports")
async def create_import(file: UploadFile = File(...)):
    os.makedirs("/data/imports", exist_ok=True)
    path = f"/data/imports/{uuid.uuid4()}_{file.filename}"
    with open(path, "wb") as f:
        f.write(await file.read())
    return {"id": str(uuid.uuid4()), "file_path": path}

@app.post("/api/campaigns")
async def create_campaign(payload: dict):
    return {"id": str(uuid.uuid4())}

@app.post("/api/dlr/webhook")
async def dlr(req: Request):
    _ = await req.json()
    return JSONResponse({"ok": True})

@app.post("/api/inbound/webhook")
async def inbound(req: Request):
    _ = await req.json()
    return JSONResponse({"ok": True})
