shared_examples 'a valid API response' do |status = 200|
  it 'does not raise any exception' do
    expect { subject }.to_not raise_error
  end

  it "returns status code #{status}" do
    expect(subject.status).to eq status
  end

  it 'returns valid JSON' do
    expect(valid_json?(subject.body)).to eq true
  end
end
