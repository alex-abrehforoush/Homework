long long int myPower(long long int b, long long int p)
{
	result = 1;
	for (long long int i = p; i > 0; i--)
	{
		result *= b;
	}
	return result;
}
