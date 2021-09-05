mkdir -p ${DOWNLOADDIR}/uboot
pushd ${DOWNLOADDIR}/uboot
curl -JLO https://kiljan.org/downloads/pi/uboot-raspberrypi-rc-2021.07rc3-1-aarch64.pkg.tar.xz
tar xf *
cp boot/kernel8.img ${SDMOUNT}/boot/
popd
