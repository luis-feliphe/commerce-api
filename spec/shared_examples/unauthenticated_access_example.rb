shared_examples "unauthenticated access" do 

    
    it "return unauthorized status" do
        expect(response).to have_http_status(:unauthorized)    
    end
end