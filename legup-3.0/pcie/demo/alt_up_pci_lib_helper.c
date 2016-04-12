#include <stdlib.h>
#include <pthread.h>

#include "alt_up_pci_lib.h"
#include "alt_up_pci_lib_helper.h"

#define CTRLLER_ID     0

static int fd = 0;

// Function definitions
void pci_init()
{
  static pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
  pthread_mutex_lock(&fd_lock);
  // Open the device file, if needed
  if (!fd) {
    if (alt_up_pci_open(&fd, "/dev/alt_up_pci0")) {
      pthread_mutex_unlock(&fd_lock);
      exit(1);
    }
  }
  pthread_mutex_unlock(&fd_lock);
}

void pci_close()
{
  alt_up_pci_close(fd);
  fd = 0;
}

void pci_write_data(void *buf, int len, int offset)
{
  pci_write_data_with_ctrller(buf, len, offset, CTRLLER_ID);
}

void pci_read_data(void *buf, int len, int offset)
{
  pci_read_data_with_ctrller(buf, len, offset, CTRLLER_ID);
}

void pci_dma_go()
{
  pci_dma_go_with_ctrller(CTRLLER_ID);
}

void pci_write_data_with_ctrller(void *buf, int len, int offset, int ctrller)
{
  if (!fd) {
    pci_init();
  }

  // Write data via DMA
  if (alt_up_pci_dma_add(fd, ctrller, offset, buf, len, TO_DEVICE)) {
    exit(1);
  }
}

void pci_read_data_with_ctrller(void *buf, int len, int offset, int ctrller)
{
  // Read the data back
  if (alt_up_pci_dma_add(fd, ctrller, offset, buf, len, FROM_DEVICE)) {
    exit(1);
  }
}

void pci_dma_go_with_ctrller(int ctrller)
{
  // Release DMA
  if (alt_up_pci_dma_go(fd, ctrller, AUTO)) {
    exit(1);
  }
}
