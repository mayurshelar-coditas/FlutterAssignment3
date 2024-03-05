void mergeSort(List<int> array, int leftIndex, int rightIndex) {
  if (leftIndex < rightIndex) {
    int middle = leftIndex + (rightIndex - leftIndex) ~/ 2;

    mergeSort(array, leftIndex, middle);
    mergeSort(array, middle + 1, rightIndex);

    merge(array, leftIndex, middle, rightIndex);
  }
}

void merge(List<int> array, int leftIndex, int middle, int rightIndex) {
  int n1 = middle - leftIndex + 1;
  int n2 = rightIndex - middle;

  List<int> L = List.filled(n1, 0);
  List<int> R = List.filled(n2, 0);

  for (int i = 0; i < n1; i++) {
    L[i] = array[leftIndex + i];
  }
  for (int j = 0; j < n2; j++) {
    R[j] = array[middle + 1 + j];
  }

  int i = 0, j = 0;

  int k = leftIndex;
  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      array[k] = L[i];
      i++;
    } else {
      array[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    array[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    array[k] = R[j];
    j++;
    k++;
  }
}
