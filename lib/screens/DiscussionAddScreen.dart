part of 'Screens.dart';

class DiscussionAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController discussionController = TextEditingController();

    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: discussionController,
              decoration: InputDecoration(
                  hintText: "Enter your diary",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.white,
                  filled: true),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 24,),
            Container(
              width: 250,
              height: 40,
              child: RaisedButton(
                onPressed: () async {
                  Discussion discussion = Discussion(
                      title: discussionController.text, time: DateTime.now());
                  await DiscussionServices.createDiscussion(discussion);
                  Navigator.pop(context);
                },
                color: auxieGreen,
                child: Center(
                    child: Text("Create",
                        style: titledText.copyWith(color: Colors.white))),
              ),
            )
          ],
        ));
  }
}
