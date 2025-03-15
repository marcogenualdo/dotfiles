function _tide_item_aws
    if test "$AWS_PROFILE"
        _tide_print_item aws 'AWS '(echo $AWS_PROFILE)
    end
end
