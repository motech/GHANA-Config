module MCollective
    module Agent
        class Smith<RPC::Agent
            metadata    :name        => "smith",
                        :description => "the matrix has you",
                        :author      => "MoTeCH Ghana",
                        :version     => "0.1",
                        :timeout     => 100

            action "create" do
                validate :name, String
            end
            action "delete" do
                validate :name, String
            end
        end
    end
end