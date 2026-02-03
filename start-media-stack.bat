@echo off
echo ========================================
echo Starting Media Stack
echo ========================================

echo.
echo [1/2] Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo.
echo Waiting for Docker Desktop to be ready...
:wait_docker
timeout /t 5 /nobreak >nul
docker info >nul 2>&1
if errorlevel 1 (
    echo Docker is not ready yet, waiting...
    goto wait_docker
)
echo Docker Desktop is ready!

echo.
echo [2/2] Starting docker-compose...
wsl -e sh -c "cd /1tb && docker-compose up -d"

echo.
echo ========================================
echo Media Stack Started Successfully!
echo ========================================
echo.
echo Services available at:
echo - qBittorrent:  http://localhost:8080
echo - Bazarr:       http://localhost:6767
echo - Radarr:       http://localhost:7878
echo - Sonarr:       http://localhost:8989
echo - Jellyfin:     http://localhost:8096
echo - Jellyseerr:   http://localhost:5055
echo.
pause
