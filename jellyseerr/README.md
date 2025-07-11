## 快速開始
### 1. deluge
http://deluge.localhost/
password deluge

## 各個服務的用途介紹：
### **1. Traefik (reverse-proxy)**
- **用途**：現代化的反向代理和負載均衡器，用於自動管理容器路由。
- **功能**：
  - 通過監聽 Docker 事件自動發現其他服務。
  <!-- - 提供 Web UI（`8888` 端口，不安全模式，僅用於開發測試）。 -->
  - 將 HTTP 流量路由到其他容器（基於 `Host` 標籤規則）。
- **端口**：
  - `80`：HTTP 流量入口。
  - `8888`：Traefik 儀表板（需搭配 `--api.insecure=true` 使用）。

---

### **2. Jellyseerr**
- **用途**：媒體請求管理工具，整合 Jellyfin/Plex 和 Sonarr/Radarr。
- **功能**：
  - 用戶可通過 Web 界面請求電影或電視劇。
  - 自動轉發請求到 Sonarr/Radarr 進行下載。
- **端口**：`5055`（Web 界面）。
- **路由**：通過 `jellyseerr.localhost` 訪問。

---

### **3. Jellyfin**
- **用途**：開源媒體服務器（類似 Plex）。
- **功能**：
  - 流式傳輸電影、電視劇、音樂等。
  - 支持轉碼、字幕、多用戶管理等。
- **端口**：`8096`（直接訪問）或通過 `jellyfin.localhost`（Traefik 路由）。
- **存儲**：
  - 配置文件存於 `./jellyfin/config`。
  - 媒體文件綁定到 `/media` 和 `/media2`。

---

### **4. Radarr**
- **用途**：電影自動化管理工具。
- **功能**：
  - 監視電影列表，自動下載缺失或升級質量的電影。
  - 支持多種下載客戶端（如 Deluge、qBittorrent）。
- **端口**：`7878`（直接訪問）或通過 `radarr.localhost`（Traefik 路由）。
- **存儲**：
  - 電影庫：`./radarr/movies`。
  - 下載目錄：`./radarr/download-client-downloads`。

---

### **5. Sonarr**
- **用途**：電視劇自動化管理工具（Radarr 的電視劇版）。
- **功能**：
  - 自動追蹤劇集，下載缺失或新集數。
  - 支持 RSS 和索引器（如 Jackett）。
- **端口**：`8989`（直接訪問）或通過 `sonarr.localhost`（Traefik 路由）。
- **存儲**：
  - 電視劇庫：`./sonarr/tvseries`。
  - 下載目錄：`./sonarr/downloadclient-downloads`。

---

### **6. uTorrent**
- **用途**：輕量級 BitTorrent 下載客戶端。
- **功能**：
  - 支持 Web 界面（`8080` 端口）或通過 `deluge.localhost`（Traefik 路由）。
  - 自動加載種子文件並下載到指定目錄。
- **端口**：
  - `8080`：Web 界面。
  - `6881`：BT 協議端口（TCP/UDP）。
- **存儲**：
  - 下載文件存於 `./utorrent/data/dir` 或綁定目錄。

---

### **7. Deluge**
- **用途**：另一種 BitTorrent 客戶端（更適合資源受限環境）。
- **功能**：
  - 支持插件擴展（如自動刪除種子）。
  - Web 界面端口 `8112`。
- **端口**：
  - `8112`：Web 界面。
  - `6881`：BT 協議端口。

---

### **8. qBittorrent**
- **用途**：開源 BitTorrent 客戶端（無廣告）。
- **功能**：
  - 類似 uTorrent，但更現代化。
  - Web 界面端口 `8080`（映射到宿主機 `8081` 避免衝突）。
- **端口**：
  - `8081`：宿主機訪問 Web 界面（容器內 `8080`）。
  - `6881`：BT 協議端口。

---

### **網絡配置**
- **`ReverseProxy` 網絡**：所有服務共享此網絡，Traefik 可自動發現並路由流量。