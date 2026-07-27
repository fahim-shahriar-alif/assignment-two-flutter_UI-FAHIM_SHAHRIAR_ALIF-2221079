import 'package:flutter/material.dart';
import '../utility/constant.dart';
import '../widgets/top_bar_widget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarWidget(),
              const SizedBox(height: 20.00),
              _buildProfileHeader(),
              const SizedBox(height: 20.00),
              _buildInfoCard('Name',       AppConstant.studentName),
              const SizedBox(height: 12.00),
              _buildInfoCard('Student ID', AppConstant.studentId),
              const SizedBox(height: 12.00),
              _buildInfoCard('Email',      AppConstant.studentEmail),
              const SizedBox(height: 20.00),
              _buildBioSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          const Text('User Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.00)),
          const SizedBox(height: 15.00),
          CircleAvatar(
            radius: 50.00,
            backgroundColor: AppConstant.primaryColor,
            child: Text(
              AppConstant.profilePicture,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32.00,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 12.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.grey, fontSize: 12.00)),
          const SizedBox(height: 4.00),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16.00)),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bio / Story',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.00)),
          const SizedBox(height: 10.00),
          Text(
            AppConstant.studentBio,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 14.00,
                fontStyle: FontStyle.italic,
                height: 1.6),
          ),
        ],
      ),
    );
  }
}
