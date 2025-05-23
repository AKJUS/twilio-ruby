##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Taskrouter
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Taskrouter < TaskrouterBase
            class V1 < Version
                class WorkspaceContext < InstanceContext

                     class WorkflowList < ListResource
                
                    ##
                    # Initialize the WorkflowList
                    # @param [Version] version Version that contains the resource
                    # @return [WorkflowList] WorkflowList
                    def initialize(version, workspace_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows"
                        
                    end
                    ##
                    # Create the WorkflowInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the Workflow resource. For example, `Inbound Call Workflow` or `2014 Outbound Campaign`.
                    # @param [String] configuration A JSON string that contains the rules to apply to the Workflow. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information.
                    # @param [String] assignment_callback_url The URL from your application that will process task assignment events. See [Handling Task Assignment Callback](https://www.twilio.com/docs/taskrouter/handle-assignment-callbacks) for more details.
                    # @param [String] fallback_assignment_callback_url The URL that we should call when a call to the `assignment_callback_url` fails.
                    # @param [String] task_reservation_timeout How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`.
                    # @return [WorkflowInstance] Created WorkflowInstance
                    def create(
                        friendly_name: nil, 
                        configuration: nil, 
                        assignment_callback_url: :unset, 
                        fallback_assignment_callback_url: :unset, 
                        task_reservation_timeout: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Configuration' => configuration,
                            'AssignmentCallbackUrl' => assignment_callback_url,
                            'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
                            'TaskReservationTimeout' => task_reservation_timeout,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        WorkflowInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                        )
                    end

                
                    ##
                    # Lists WorkflowInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] friendly_name The `friendly_name` of the Workflow resources to read.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(friendly_name: :unset, limit: nil, page_size: nil)
                        self.stream(
                            friendly_name: friendly_name,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] friendly_name The `friendly_name` of the Workflow resources to read.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(friendly_name: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            friendly_name: friendly_name,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields WorkflowInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of WorkflowInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] friendly_name The `friendly_name` of the Workflow resources to read.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of WorkflowInstance
                    def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        WorkflowPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of WorkflowInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of WorkflowInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    WorkflowPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.WorkflowList>'
                    end
                end


                class WorkflowContext < InstanceContext
                    ##
                    # Initialize the WorkflowContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the Workflow to update.
                    # @param [String] sid The SID of the Workflow resource to update.
                    # @return [WorkflowContext] WorkflowContext
                    def initialize(version, workspace_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, sid: sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:sid]}"

                        # Dependents
                        @statistics = nil
                        @cumulative_statistics = nil
                        @real_time_statistics = nil
                    end
                    ##
                    # Delete the WorkflowInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the WorkflowInstance
                    # @return [WorkflowInstance] Fetched WorkflowInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        WorkflowInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the WorkflowInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the Workflow resource. For example, `Inbound Call Workflow` or `2014 Outbound Campaign`.
                    # @param [String] assignment_callback_url The URL from your application that will process task assignment events. See [Handling Task Assignment Callback](https://www.twilio.com/docs/taskrouter/handle-assignment-callbacks) for more details.
                    # @param [String] fallback_assignment_callback_url The URL that we should call when a call to the `assignment_callback_url` fails.
                    # @param [String] configuration A JSON string that contains the rules to apply to the Workflow. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information.
                    # @param [String] task_reservation_timeout How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`.
                    # @param [String] re_evaluate_tasks Whether or not to re-evaluate Tasks. The default is `false`, which means Tasks in the Workflow will not be processed through the assignment loop again.
                    # @return [WorkflowInstance] Updated WorkflowInstance
                    def update(
                        friendly_name: :unset, 
                        assignment_callback_url: :unset, 
                        fallback_assignment_callback_url: :unset, 
                        configuration: :unset, 
                        task_reservation_timeout: :unset, 
                        re_evaluate_tasks: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'AssignmentCallbackUrl' => assignment_callback_url,
                            'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
                            'Configuration' => configuration,
                            'TaskReservationTimeout' => task_reservation_timeout,
                            'ReEvaluateTasks' => re_evaluate_tasks,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        WorkflowInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the statistics
                    # @return [WorkflowStatisticsList]
                    # @return [WorkflowStatisticsContext]
                    def statistics
                        WorkflowStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the cumulative_statistics
                    # @return [WorkflowCumulativeStatisticsList]
                    # @return [WorkflowCumulativeStatisticsContext]
                    def cumulative_statistics
                        WorkflowCumulativeStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the real_time_statistics
                    # @return [WorkflowRealTimeStatisticsList]
                    # @return [WorkflowRealTimeStatisticsContext]
                    def real_time_statistics
                        WorkflowRealTimeStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkflowContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkflowContext #{context}>"
                    end
                end

                class WorkflowPage < Page
                    ##
                    # Initialize the WorkflowPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WorkflowPage] WorkflowPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WorkflowInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WorkflowInstance] WorkflowInstance
                    def get_instance(payload)
                        WorkflowInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.WorkflowPage>'
                    end
                end
                class WorkflowInstance < InstanceResource
                    ##
                    # Initialize the WorkflowInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Workflow
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WorkflowInstance] WorkflowInstance
                    def initialize(version, payload , workspace_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'assignment_callback_url' => payload['assignment_callback_url'],
                            'configuration' => payload['configuration'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'document_content_type' => payload['document_content_type'],
                            'fallback_assignment_callback_url' => payload['fallback_assignment_callback_url'],
                            'friendly_name' => payload['friendly_name'],
                            'sid' => payload['sid'],
                            'task_reservation_timeout' => payload['task_reservation_timeout'] == nil ? payload['task_reservation_timeout'] : payload['task_reservation_timeout'].to_i,
                            'workspace_sid' => payload['workspace_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WorkflowContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WorkflowContext.new(@version , @params['workspace_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workflow resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The URL that we call when a task managed by the Workflow is assigned to a Worker. See Assignment Callback URL for more information.
                    def assignment_callback_url
                        @properties['assignment_callback_url']
                    end
                    
                    ##
                    # @return [String] A JSON string that contains the Workflow's configuration. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information.
                    def configuration
                        @properties['configuration']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The MIME type of the document.
                    def document_content_type
                        @properties['document_content_type']
                    end
                    
                    ##
                    # @return [String] The URL that we call when a call to the `assignment_callback_url` fails.
                    def fallback_assignment_callback_url
                        @properties['fallback_assignment_callback_url']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the Workflow resource. For example, `Customer Support` or `2014 Election Campaign`.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Workflow resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`.
                    def task_reservation_timeout
                        @properties['task_reservation_timeout']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the Workflow.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Workflow resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the WorkflowInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the WorkflowInstance
                    # @return [WorkflowInstance] Fetched WorkflowInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the WorkflowInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the Workflow resource. For example, `Inbound Call Workflow` or `2014 Outbound Campaign`.
                    # @param [String] assignment_callback_url The URL from your application that will process task assignment events. See [Handling Task Assignment Callback](https://www.twilio.com/docs/taskrouter/handle-assignment-callbacks) for more details.
                    # @param [String] fallback_assignment_callback_url The URL that we should call when a call to the `assignment_callback_url` fails.
                    # @param [String] configuration A JSON string that contains the rules to apply to the Workflow. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information.
                    # @param [String] task_reservation_timeout How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`.
                    # @param [String] re_evaluate_tasks Whether or not to re-evaluate Tasks. The default is `false`, which means Tasks in the Workflow will not be processed through the assignment loop again.
                    # @return [WorkflowInstance] Updated WorkflowInstance
                    def update(
                        friendly_name: :unset, 
                        assignment_callback_url: :unset, 
                        fallback_assignment_callback_url: :unset, 
                        configuration: :unset, 
                        task_reservation_timeout: :unset, 
                        re_evaluate_tasks: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            assignment_callback_url: assignment_callback_url, 
                            fallback_assignment_callback_url: fallback_assignment_callback_url, 
                            configuration: configuration, 
                            task_reservation_timeout: task_reservation_timeout, 
                            re_evaluate_tasks: re_evaluate_tasks, 
                        )
                    end

                    ##
                    # Access the statistics
                    # @return [statistics] statistics
                    def statistics
                        context.statistics
                    end

                    ##
                    # Access the cumulative_statistics
                    # @return [cumulative_statistics] cumulative_statistics
                    def cumulative_statistics
                        context.cumulative_statistics
                    end

                    ##
                    # Access the real_time_statistics
                    # @return [real_time_statistics] real_time_statistics
                    def real_time_statistics
                        context.real_time_statistics
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkflowInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkflowInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


