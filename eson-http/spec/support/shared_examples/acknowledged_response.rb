shared_examples 'an acknowledged response' do
  it 'contains "acknowledged" property' do
    response = json_parse(subject.body)
    expect(response.has_key?('acknowledged')).to eq true
  end

  it 'returns true' do
    response = json_parse(subject.body)
    expect(response['acknowledged']).to eq true
  end
end
