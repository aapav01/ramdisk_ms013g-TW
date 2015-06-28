#!/system/bin/sh

/system/xbin/busybox mount -t rootfs -o remount,rw rootfs

ln -s /system/xbin/busybox /sbin/busybox

# Disable knox
pm disable com.sec.knox.seandroid
setenforce 0

/system/xbin/daemonsu --auto-daemon &

if [ -d /system/etc/init.d ]; then
  /sbin/busybox run-parts /system/etc/init.d
fi

/system/xbin/busybox mount -t rootfs -o remount,ro rootfs
