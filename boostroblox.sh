#!/bin/bash
# =====================================================
# ⚡ ROBLOX OVERPOWER BOOSTER – AUTO UPDATE (GitHub)
# Samsung A10s / Android 11
# MAX FPS • NO FRAME DROP • SUPER RESPONSIVE
# =====================================================

REPO_URL="https://raw.githubusercontent.com/username/roblox-booster/main/roblox_booster.sh"

# =====================================================
# 🔄 AUTO UPDATE SYSTEM
# =====================================================
echo "🔄 Mengecek update terbaru dari GitHub..."
curl -fsSL "$REPO_URL" -o /tmp/roblox_booster.sh

if [ -s /tmp/roblox_booster.sh ]; then
    echo "✅ Script terbaru ditemukan, menjalankan update..."
    bash /tmp/roblox_booster.sh
    exit 0
else
    echo "⚠️ Tidak dapat mengunduh update, menggunakan versi lokal..."
fi

# =====================================================
# ⚙️  MAIN BOOSTER SCRIPT
# =====================================================
clear
echo "====================================================="
echo "     ⚙️  ROBLOX BOOSTER "
echo "        Samsung A10s / Android 11"
echo "====================================================="
echo

echo "Pilih Mode:"
echo "1) 🚀 BOOST MODE (Overpower Performance)"
echo "2) ♻️ RESTORE MODE (Kembali ke Default)"
read -p "Masukkan pilihan [1-2]: " mode

if [ "$mode" = "1" ]; then
    echo
    echo "→ Menjalankan OVERPOWER BOOST..."
    sleep 1

    # -------------------------------------------------
    # 1) SYSTEM & ANIMATION OPTIMIZATION
    # -------------------------------------------------
    echo "→ Menonaktifkan animasi sistem..."
    settings put global window_animation_scale 0 >/dev/null 2>&1
    settings put global transition_animation_scale 0 >/dev/null 2>&1
    settings put global animator_duration_scale 0 >/dev/null 2>&1

    # -------------------------------------------------
    # 2) I/O & SYSTEM RESPONSIVENESS BOOST
    # -------------------------------------------------
    echo "→ Meningkatkan respons sistem I/O..."
    settings put global fstrim_mandatory_interval 1 >/dev/null 2>&1
    cmd package bg-dexopt-job >/dev/null 2>&1
    settings put global sched_group_idle 0 >/dev/null 2>&1
    settings put global sched_boost 1 >/dev/null 2>&1

    # -------------------------------------------------
    # 3) GPU & RENDERING OPTIMIZATION (safe)
    # -------------------------------------------------
    echo "→ Mengoptimalkan GPU rendering..."
    settings put global disable_hw_overlays 1 >/dev/null 2>&1
    settings put global debug_hwui_profile false >/dev/null 2>&1
    settings put global debug_hwui_force_dark 0 >/dev/null 2>&1
    settings put global enable_gpu_debug_layers 0 >/dev/null 2>&1
    settings put global opengl_triple_buffering 1 >/dev/null 2>&1

    # -------------------------------------------------
    # 4) CPU & PERFORMANCE HINTS (non-root safe)
    # -------------------------------------------------
    echo "→ Mengaktifkan mode performa maksimum..."
    cmd power set-fixed-performance-mode-enabled true >/dev/null 2>&1
    cmd power set-adaptive-power-saver-enabled false >/dev/null 2>&1
    cmd deviceidle disable >/dev/null 2>&1
    settings put global low_power 0 >/dev/null 2>&1
    cmd power set-mode 1 >/dev/null 2>&1
    settings put global cpu_min_freq_policy 1 >/dev/null 2>&1
    settings put global power_saver_mode 0 >/dev/null 2>&1

    # -------------------------------------------------
    # 5) TOUCH / INPUT OPTIMIZATION
    # -------------------------------------------------
    echo "→ Mengoptimalkan kecepatan sentuhan..."
    settings put system pointer_speed 7 >/dev/null 2>&1
    settings put system long_press_timeout 150 >/dev/null 2>&1
    settings put system tap_duration_threshold 100 >/dev/null 2>&1
    settings put global input_event_timeout 5 >/dev/null 2>&1
    settings put global input_boost_duration 200 >/dev/null 2>&1
    settings put global touch_blocking_duration 0 >/dev/null 2>&1

    # -------------------------------------------------
    # 6) BACKGROUND PROCESS & MEMORY HANDLER
    # -------------------------------------------------
    echo "→ Membatasi proses latar belakang..."
    settings put global background_process_limit 1 >/dev/null 2>&1
    settings put system activity_manager_constants "max_cached_processes=3" >/dev/null 2>&1
    cmd activity idle-maintenance >/dev/null 2>&1
    pm trim-caches 200M >/dev/null 2>&1
    cmd package trim-caches 200M >/dev/null 2>&1
    am kill-all >/dev/null 2>&1

    # -------------------------------------------------
    # 7) DISPLAY / GPU COMPOSITION OPTIMIZATION
    # -------------------------------------------------
    echo "→ Menstabilkan rendering UI..."
    settings put global debug.hwui.disable_vsync false >/dev/null 2>&1
    settings put global debug.hwui.render_dirty_regions false >/dev/null 2>&1
    settings put global debug.composition.type gpu >/dev/null 2>&1

    # -------------------------------------------------
    # 8) ROBLOX PRIORITY BOOST
    # -------------------------------------------------
    echo "→ Memberi prioritas tinggi ke Roblox..."
    cmd appops set com.roblox.client RUN_IN_BACKGROUND allow >/dev/null 2>&1
    cmd appops set com.roblox.client WAKE_LOCK allow >/dev/null 2>&1
    cmd appops set com.roblox.client KEEP_ALIVE allow >/dev/null 2>&1
    am set-inactive com.roblox.client false >/dev/null 2>&1
    am set-standby-bucket com.roblox.client active >/dev/null 2>&1

    # -------------------------------------------------
    # 9) SYSTEM CLEANUP
    # -------------------------------------------------
    echo "→ Membersihkan cache & sinkronisasi..."
    sync
    cmd activity idle-maintenance >/dev/null 2>&1
    pm trim-caches 200M >/dev/null 2>&1

    echo
    echo "====================================================="
    echo "✅ BOOST COMPLETE – OVERPOWER MODE (Non-root)"
    echo "====================================================="
    echo "💡 Tips:"
    echo "1. Tutup semua aplikasi berat sebelum main Roblox."
    echo "2. Gunakan mode pesawat + WiFi stabil."
    echo "3. Jalankan skrip ini ulang setiap kali reboot."
    echo "====================================================="

elif [ "$mode" = "2" ]; then
    echo
    echo "→ Mengembalikan semua ke pengaturan default..."
    sleep 1

    settings put global window_animation_scale 1 >/dev/null 2>&1
    settings put global transition_animation_scale 1 >/dev/null 2>&1
    settings put global animator_duration_scale 1 >/dev/null 2>&1
    settings put global background_process_limit -1 >/dev/null 2>&1
    settings delete system activity_manager_constants >/dev/null 2>&1
    settings delete global disable_hw_overlays >/dev/null 2>&1
    settings delete global debug_hwui_profile >/dev/null 2>&1
    settings delete global debug_hwui_force_dark >/dev/null 2>&1
    settings delete global enable_gpu_debug_layers >/dev/null 2>&1
    settings delete global opengl_triple_buffering >/dev/null 2>&1
    settings delete global sched_boost >/dev/null 2>&1
    settings delete global cpu_min_freq_policy >/dev/null 2>&1
    settings delete global input_event_timeout >/dev/null 2>&1
    settings delete global input_boost_duration >/dev/null 2>&1
    settings delete global touch_blocking_duration >/dev/null 2>&1
    settings delete system pointer_speed >/dev/null 2>&1
    settings delete system long_press_timeout >/dev/null 2>&1
    settings delete system tap_duration_threshold >/dev/null 2>&1
    settings delete global debug.hwui.disable_vsync >/dev/null 2>&1
    settings delete global debug.hwui.render_dirty_regions >/dev/null 2>&1
    settings delete global debug.composition.type >/dev/null 2>&1
    cmd thermalservice reset >/dev/null 2>&1
    cmd power set-fixed-performance-mode-enabled false >/dev/null 2>&1
    cmd power set-adaptive-power-saver-enabled true >/dev/null 2>&1
    cmd deviceidle enable >/dev/null 2>&1

    echo
    echo "====================================================="
    echo "♻️  RESTORE COMPLETE – Semua pengaturan dikembalikan."
    echo "====================================================="
else
    echo "❌ Pilihan tidak valid!"
fi