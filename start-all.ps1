# RoadSafe AI — Full Platform Multi-Process Launcher
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "          RoadSafe AI — Full-Stack Platform Launcher      " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

$RootPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1. Start AI Inference Service
Write-Host "[1/3] Starting Python FastAPI AI Inference Service (Port 8000)..." -ForegroundColor Yellow
$AiProcess = Start-Process python -ArgumentList "-m uvicorn app.main:app --port 8000 --reload" -WorkingDirectory "$RootPath\ai-service" -PassThru

# 2. Start Express Backend
Write-Host "[2/3] Starting Node.js Express REST API (Port 5000)..." -ForegroundColor Yellow
$ServerProcess = Start-Process npm -ArgumentList "start" -WorkingDirectory "$RootPath\server" -PassThru

# 3. Start React Vite Frontend
Write-Host "[3/3] Starting React Vite Client (Port 5173)..." -ForegroundColor Yellow
$ClientProcess = Start-Process npm -ArgumentList "run dev" -WorkingDirectory "$RootPath\client" -PassThru

Write-Host ""
Write-Host "----------------------------------------------------------" -ForegroundColor Green
Write-Host " All 3 Services Dispatched Successfully! " -ForegroundColor Green
Write-Host " - Frontend:   http://localhost:5173" -ForegroundColor Cyan
Write-Host " - Backend:    http://localhost:5000 (Health: http://localhost:5000/api/health)" -ForegroundColor Cyan
Write-Host " - AI Service: http://localhost:8000 (Docs:   http://localhost:8000/docs)" -ForegroundColor Cyan
Write-Host ""
Write-Host " Default Admin Credentials: " -ForegroundColor Yellow
Write-Host " - Email:    admin@roadsafe.ai"
Write-Host " - Password: AdminSafe@2026!"
Write-Host "----------------------------------------------------------" -ForegroundColor Green
Write-Host "Press Ctrl+C or close opened windows to terminate processes."
