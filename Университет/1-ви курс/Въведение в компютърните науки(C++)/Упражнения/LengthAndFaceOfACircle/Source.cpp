/*�� �� ������ ��������,����� ������� ������� �� ��������� � ������ � ������� ��������� �� ����������� � ������ �� ����� � ������� ������.*/
#include <iostream>
using namespace std;
int main() {
	double pi = 3.14;
	double r;//����������� �� ���������� �� ����������� �� ������
	cout << "R=";//����������� �� ������ R=
	cin >> r;//���� �� r
	double S;
	S = pi * r * r;//���������� �� ����
	double L = 2 * pi * r;//���������� �� ��������
	cout << "S=" << S << endl;//����������� �� S
	cout << "L=" << L << endl;//����������� �� ��������
	return 0;
}