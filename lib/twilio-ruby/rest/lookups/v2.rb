##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Lookups
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Lookups
            class V2 < Version
                ##
                # Initialize the V2 version of Lookups
                def initialize(domain)
                    super
                    @version = 'v2'
                    @bucket = nil
                    @lookup_overrides = nil
                    @phone_numbers = nil
                    @query = nil
                    @rate_limits = nil
                end

                ##
                # @param [String] field bucket name
                # @param [String] bucket bucket name
                # @return [Twilio::REST::Lookups::V2::BucketContext] if field was passed.
                # @return [Twilio::REST::Lookups::V2::BucketList]
                def bucket(field=:unset, bucket=:unset)
                    if field.nil?
                        raise ArgumentError, 'field cannot be nil'
                    end
                    if bucket.nil?
                        raise ArgumentError, 'bucket cannot be nil'
                    end
                    if field == :unset && bucket == :unset
                        @bucket ||= BucketList.new self
                    else
                        BucketContext.new(self, field, bucket)
                    end
                end
                ##
                # @param [String] field bucket name
                # @param [String] bucket bucket name
                # @return [Twilio::REST::Lookups::V2::BucketContext] if bucket was passed.
                # @return [Twilio::REST::Lookups::V2::BucketList]
                def bucket(field=:unset, bucket=:unset)
                    if field.nil?
                        raise ArgumentError, 'field cannot be nil'
                    end
                    if bucket.nil?
                        raise ArgumentError, 'bucket cannot be nil'
                    end
                    if field == :unset && bucket == :unset
                        @bucket ||= BucketList.new self
                    else
                        BucketContext.new(self, field, bucket)
                    end
                end
                ##
                # @param [String] field 
                # @param [String] phone_number 
                # @return [Twilio::REST::Lookups::V2::LookupOverrideContext] if field was passed.
                # @return [Twilio::REST::Lookups::V2::LookupOverrideList]
                def lookup_overrides(field=:unset, phone_number=:unset)
                    if field.nil?
                        raise ArgumentError, 'field cannot be nil'
                    end
                    if phone_number.nil?
                        raise ArgumentError, 'phone_number cannot be nil'
                    end
                    if field == :unset && phone_number == :unset
                        @lookup_overrides ||= LookupOverrideList.new self
                    else
                        LookupOverrideContext.new(self, field, phone_number)
                    end
                end
                ##
                # @param [String] field 
                # @param [String] phone_number 
                # @return [Twilio::REST::Lookups::V2::LookupOverrideContext] if phoneNumber was passed.
                # @return [Twilio::REST::Lookups::V2::LookupOverrideList]
                def lookup_overrides(field=:unset, phone_number=:unset)
                    if field.nil?
                        raise ArgumentError, 'field cannot be nil'
                    end
                    if phone_number.nil?
                        raise ArgumentError, 'phone_number cannot be nil'
                    end
                    if field == :unset && phone_number == :unset
                        @lookup_overrides ||= LookupOverrideList.new self
                    else
                        LookupOverrideContext.new(self, field, phone_number)
                    end
                end
                ##
                # @param [String] phone_number The phone number to lookup in E.164 or national format. Default country code is +1 (North America).
                # @return [Twilio::REST::Lookups::V2::PhoneNumberContext] if phoneNumber was passed.
                # @return [Twilio::REST::Lookups::V2::PhoneNumberList]
                def phone_numbers(phone_number=:unset)
                    if phone_number.nil?
                        raise ArgumentError, 'phone_number cannot be nil'
                    end
                    if phone_number == :unset
                        @phone_numbers ||= PhoneNumberList.new self
                    else
                        PhoneNumberContext.new(self, phone_number)
                    end
                end
                ##
                # @return [Twilio::REST::Lookups::V2::QueryList]
                def query
                    @query ||= QueryList.new self
                end
                ##
                # @return [Twilio::REST::Lookups::V2::RateLimitList]
                def rate_limits
                    @rate_limits ||= RateLimitList.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Lookups::V2>';
                end
            end
        end
    end
end
