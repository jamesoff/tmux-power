BEGIN { FS=";" }
{
	percent=$1
	state=$2
	sub(/.+ ([[:digit:]]+)%/, "\1", percent)

	print percent, state
}
